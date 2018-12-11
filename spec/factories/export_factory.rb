FactoryBot.define do
  factory :export, class: EtCcdExport::Test::Export do
    system { build(:system) }
    resource { nil }

    trait :for_claim do
      resource { build(:claim) }
      resource_type { 'Claim' }
    end
  end
end
