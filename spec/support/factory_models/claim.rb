module EtCcdExport
  module Test
    class Claim
      include ActiveModel::Model
      include ActiveModel::Attributes

      attribute :reference, :string
      attribute :submission_reference, :string
      attribute :submission_channel, :string
      attribute :case_type, :string
      attribute :jurisdiction, :integer
      attribute :office_code, :integer
      attribute :date_of_receipt, :datetime
      attribute :primary_claimant
      attribute :secondary_claimants, default: []
      attribute :claimant_count, :integer, default: 0

    end
  end
end
