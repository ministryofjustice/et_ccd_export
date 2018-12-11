module EtCcdExport
  module Test
    class Base
      include ActiveModel::Model
      include ActiveModel::Attributes

      delegate :as_json, to: :attributes
    end
  end
end
