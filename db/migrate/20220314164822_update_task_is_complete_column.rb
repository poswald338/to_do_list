class UpdateTaskIsCompleteColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :isComplete, :boolean, default: false
  end
end
