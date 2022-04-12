class UsersTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :user, uniqueness: true
  validates :task, uniqueness: true

end