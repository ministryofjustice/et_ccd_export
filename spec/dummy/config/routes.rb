Rails.application.routes.draw do
  mount EtCcdExport::Engine => "/et_ccd_export"
end
