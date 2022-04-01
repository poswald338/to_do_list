class AddImagePathColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :img_path, :string
  end
end
