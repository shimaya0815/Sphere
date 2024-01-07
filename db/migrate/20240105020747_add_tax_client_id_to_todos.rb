class AddTaxClientIdToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :tax_client_id, :integer
  end
end
