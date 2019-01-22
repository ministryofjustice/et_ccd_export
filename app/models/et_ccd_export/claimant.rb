module EtCcdExport
  class Claimant < ApplicationRecord
    self.table_name = :claimants
    belongs_to :address
  end

end
