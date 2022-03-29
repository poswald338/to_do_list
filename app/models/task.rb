# Schema Data Tasks

#   t.string "title"
#   t.text "description"
#   t.boolean "isComplete", default: false
#   t.integer "priority"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false

class Task < ApplicationRecord
  has_many :users_tasks
  has_many :users, through: :users_tasks

  # validates_with TitleValidator
  validates :title, presence: true
  validates :description, presence: true
  validates :priority, presence: true, numericality: {less_than_or_equal_to: 3}

  scope :completed, -> {where(:isComplete => true)}
  scope :long_title, -> {where("LENGTH(title) > 20")}
end