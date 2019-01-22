module EtCcdExport
  class ClaimClaimant < ApplicationRecord
    belongs_to :claim
    belongs_to :claimant
  end
end
