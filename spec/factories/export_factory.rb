FactoryBot.define do
  factory :export, class: EtCcdExport::Test::Export do
    system { build(:system) }
  end
end
