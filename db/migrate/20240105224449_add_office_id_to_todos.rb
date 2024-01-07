class AddOfficeIdToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :office_id, :integer
  end
end
