class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :priority, presence: true, numericality: {less_than_or_equal_to: 3}
  validates :isComplete, presence: true
end