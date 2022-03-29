# Schema Data -> Users

#   t.string "username"
#   t.string "email"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false

class User < ApplicationRecord 
  has_and_belongs_to_many :tasks

  validates :username, presence: true
  validates :email, presence: true
end