class CreateEtCcdExportExternalSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :external_systems do |t|
      t.string :name
      t.string :reference
      t.integer :office_codes, array: true
      t.boolean :enabled

      t.timestamps
    end
  end
end
