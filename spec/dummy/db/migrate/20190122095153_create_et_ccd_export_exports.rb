class CreateEtCcdExportExports < ActiveRecord::Migration[5.2]
  def change
    create_table :exports do |t|
      t.references :resource, polymorphic: true
      t.references :external_system, foreign_key: true

      t.timestamps
    end
  end
end
