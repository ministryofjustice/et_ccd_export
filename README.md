# Et CCD Export

Employment Tribunal (ET) case management tool will soon be replaced with our very own CCD (Core Case Data).

This gem will be installed into the ET-API system and will be responsible for ensuring that every claim gets to CCD.

Responses (ET3) are out of scope initially, but I would guess that they will become in scope at some point.

The motivation for developing this as a separate gem that could even potentially be a separate process is to
follow the traditional 12 factor approach (https://12factor.net/) so that the central API on its own becomes nice and
simple and not a huge monolith.  This approach also allows for much easier development - imagine this gem as an 'adapter' that
can easily be disabled (either in the admin or just comment it out of the gemfile) - then you dont have to worry about
having an instance of CCD running in order to make a simple isolated change to the api.

## Usage

There is no configuration apart from adding the gemfile.  The gem will automatically register for the events that
it wants etc and just work.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'et_ccd_export'
```

And then execute:
```bash
$ bundle
```

## General Design

This gem hooks into the ET API application by registering for the 'ClaimExported' event which
contains an entire 'Export' in a nested hash.
An 'Export' contains 2 things - a 'system definition' (with details of username, password, any other connection details etc..)
and a 'resource' - which in this case is a claim.
The system definition is configured in the main admin for each 'external system' (which CCD is just one of - we also have these
for ATOS as well).

The claim also includes its claimants, respondents, representatives, the pdf file etc..

The idea being that this is generally for 'external stuff' to deal with - preventing the need for the
this gem to share the database with the API.  The handler could even be in an external process.
Note that when we register for this event, we ask for it to be async so that sidekiq is involved for its
retry mechanism etc..

The event will have guard conditions so this handler will only get told if it is for a particular external
system (matched by reference).  Also, the standard functionality of the ET-API is that the event isnt even published unless
the office code for the claim is handled by the defined external system - so the events we receive SHOULD definitely be
sent to CCD - we dont have to make a decision inside this gem.

Once this gem receives the event, it will immediately pass it on to CCD via the CCD API. If this fails, the whole handler
will fail and will rely on the sidekiq process within the API application to re try this event.  This prevents this gem having to
have its own sidekiq instance which would need managing etc..

When CCD also wants to receive a response, we will also register for the 'ResponseExported' event etc...  But for the moment,
they only want claims.

### What this event data looks like

```ruby
  {
    system: {
        id: 1,
        name: 'CCD Live System',
        reference: 'ccd_live',
        office_codes: [12,14,66,99],
        enabled: true,
        config: {
            url: 'http://ccd.com',
            secret: 'somethingsupersecret'
        }
    },
    resource_type: 'Claim',
    resource: {
        reference: '14201632/2016/10',
        submission_reference: '1023-4567',
        other..normal..claim..data,
        primary_claimant: {
            claimant_data...
        },
        secondary_claimants: [
            {
                claimant_data...
            },
            {
                claimant_data...
            }
        ],
        primary_respondent: {
            respondent_data...
        },
        secondary_respondents: [
            {
                respondent_data....
            }
        ],
        representative: {
            representative_data...
        }
    }
  }
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
