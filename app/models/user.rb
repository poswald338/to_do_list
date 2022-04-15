# Schema Data -> Users

#   t.string "username"
#   t.string "email"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false

class User < ApplicationRecord 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_secure_password
  has_many :notifications
  has_many :users_tasks
  has_many :tasks, through: :users_tasks

  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 15}
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 8}
end