# Schema Data -> Users

#   t.string "username"
#   t.string "email"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false

class User < ApplicationRecord 
  has_secure_password
  has_many :users_tasks
  has_many :tasks, through: :users_tasks

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end