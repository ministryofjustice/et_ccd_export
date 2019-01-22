class CreateEtCcdExportClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.string :reference
      t.string :submission_reference
      t.string :submission_channel
      t.string :case_type
      t.integer :jurisdiction
      t.integer :office_code
      t.datetime :date_of_receipt
      t.belongs_to :primary_claimant
      t.integer :claimant_count, default: 0, null: false

      t.timestamps
    end
  end
end
