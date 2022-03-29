class ChangeUsersAndTasksToUsersTasks < ActiveRecord::Migration[6.1]
  def change
    rename_table :users_and_tasks, :users_tasks
  end
end
