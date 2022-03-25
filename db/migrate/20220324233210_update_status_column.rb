class UpdateStatusColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :status, :string, default: "Incomplete"
  end
end
