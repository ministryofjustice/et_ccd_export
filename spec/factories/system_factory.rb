FactoryBot.define do
  factory :system, class: EtCcdExport::Test::System do
    sequence(:id) { |idx| idx }
    sequence(:name) { |idx| "CCD Instance #{idx}" }
    reference { "ccd_instance_#{id}" }
    office_codes { [] }
    enabled { true }
    config do
      {
        url: 'http://someurl.com',
        idam_service_token_exchange_url: 'http://localhost:4502/testing-support/lease',
        idam_user_token_exchange_url: 'http://localhost:4501/testing-support/lease',
        create_case_url: 'http://localhost:4452/caseworkers/{uid}/jurisdictions/{jid}/case-types/{ctid}/cases',
        initiate_case_url: 'http://localhost:4452/caseworkers/{uid}/jurisdictions/{jid}/case-types/{ctid}/event-triggers/{etid}/token',
        user_id: 38,
        user_role: 'caseworker-publiclaw',
        secret: 'nottellingyou',
        jurisdiction_id: 'PUBLICLAW',
        case_type_id: 'TRIB_MVP_3_TYPE',
        initiate_claim_event_id: 'initiateCase'
      }
    end
  end
end
