module EtCcdExport
  class ExternalSystem < ApplicationRecord
    self.table_name = :external_systems
    has_many :configurations, class_name: 'ExternalSystemConfiguration', dependent: :destroy

    def config
      @config ||= configurations.inject({}) do |acc, configuration|
        acc[configuration.key.to_sym] = configuration.value
        acc
      end
    end

  end
end
