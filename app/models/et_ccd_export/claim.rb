module EtCcdExport
  class Claim < ApplicationRecord
    self.table_name = :claims
    has_many :claim_claimants, dependent: :destroy, class_name: 'EtCcdExport::ClaimClaimant'
    belongs_to :primary_claimant, class_name: 'EtCcdExport::Claimant'
    has_many :secondary_claimants, dependent: :destroy, class_name: 'Claimant',
      through: :claim_claimants, source: :claimant
  end
end
