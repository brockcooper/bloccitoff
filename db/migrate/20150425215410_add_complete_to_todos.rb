class AddCompleteToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :if_complete, :boolean, default: false
  end
end
