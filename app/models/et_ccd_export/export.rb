module EtCcdExport
  class Export < ApplicationRecord
    self.table_name = :exports
    belongs_to :resource, polymorphic: true
    belongs_to :external_system
  end
end
