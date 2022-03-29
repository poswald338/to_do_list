class CreateUsersAndTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :users_and_tasks do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.timestamps
    end
  end
end
