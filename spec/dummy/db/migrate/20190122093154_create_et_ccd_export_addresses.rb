class CreateEtCcdExportAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :building
      t.string :street
      t.string :locality
      t.string :county
      t.string :post_code

      t.timestamps
    end
  end
end
