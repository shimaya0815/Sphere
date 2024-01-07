class CreateFiscalYears < ActiveRecord::Migration[5.2]
  def change
    create_table :fiscal_years do |t|
      t.integer :period_number
      t.date :start_date
      t.date :end_date
      t.integer :tax_client_id

      t.timestamps
    end
  end
end
