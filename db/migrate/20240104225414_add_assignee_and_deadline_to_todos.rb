class AddAssigneeAndDeadlineToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :assignee_id, :integer
    add_column :todos, :deadline, :date
  end
end
