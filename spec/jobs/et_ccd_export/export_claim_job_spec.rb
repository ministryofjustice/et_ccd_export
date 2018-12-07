require 'rails_helper'
RSpec.describe EtCcdExport::ExportJob, type: :job do
  subject(:job) { described_class.new }
  describe '#perform_now' do
    it 'delegates its work to the export claim service when it is a claim export' do
      # Act
      job.perform_now(export)

      # Assert
      expect(export_claim_service).to have_received(:call).with(export)
    end

    it 'delegates its work to the export response service when it is a response export'
  end
end
