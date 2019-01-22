class CreateEtCcdExportClaimClaimants < ActiveRecord::Migration[5.2]
  def change
    create_table :claim_claimants do |t|
      t.references :claim, foreign_key: true
      t.references :claimant, foreign_key: true

      t.timestamps
    end
  end
end
