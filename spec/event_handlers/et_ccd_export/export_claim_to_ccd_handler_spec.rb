require 'rails_helper'
RSpec.describe ::EtCcdExport::ExportClaimToCcdHandler do
  subject(:handler) { described_class.new }

  context '#handle' do
    it 'schedules a job to export the export record to ccd' do
      # Act
      handler.handle(export)

      # Assert
      expect(EtCcdExport::ExportJob).to have_been_enqueued.with(export)
    end
  end
end
