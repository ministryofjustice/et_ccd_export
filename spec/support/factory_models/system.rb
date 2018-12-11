module EtCcdExport
  module Test
    class System < Base
      attribute :id, :integer
      attribute :name, :string
      attribute :reference, :string
      attribute :office_codes, default: []
      attribute :enabled, :boolean, default: true
      attribute :config, default: {}
    end
  end
end
