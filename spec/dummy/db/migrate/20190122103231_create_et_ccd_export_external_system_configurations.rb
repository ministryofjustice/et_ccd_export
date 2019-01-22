class CreateEtCcdExportExternalSystemConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :external_system_configurations do |t|
      t.string :key
      t.string :value
      t.references :external_system, foreign_key: true

      t.timestamps
    end
  end
end
