# Et CCD Export

Employment Tribunal (ET) case management tool will soon be replaced with our very own CCD (Core Case Data).

This gem will be installed into the ET-API system and will be responsible for ensuring that every claim gets to CCD.

Responses (ET3) are out of scope initially, but I would guess that they will become in scope at some point.

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
contains everything in a nested hash.  All claimants, respondents, representatives, the pdf file etc..
The idea being that this is generally for 'external stuff' to deal with - preventing the need for the
this gem to share the database with the API.  The handler could even be in an external process.
Note that when we register for this event, we ask for it to be async so that sidekiq is involved for its
retry mechanism etc..

The event will have a guard condition so this handler will only get told if it is for a particular external
system (matched by reference).

Once this gem receives the event, it will immediately pass it on to CCD via the CCD API. If this fails, the whole handler
will fail and will rely on the sidekiq process within the API application to re try this event.  This prevents this gem having to
have its own sidekiq instance which would need managing etc..

When CCD also wants to receive a response, we will also register for the 'ResponseExported' event etc...  But for the moment,
they only want claims.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
