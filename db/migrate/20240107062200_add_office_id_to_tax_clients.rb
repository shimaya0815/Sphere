class AddOfficeIdToTaxClients < ActiveRecord::Migration[5.2]
  def change
    add_column :tax_clients, :office_id, :integer
  end
end
