class CreateTaxClients < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_clients do |t|
      t.string :name
      t.string :web_app_id

      t.timestamps
    end
  end
end
