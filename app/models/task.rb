class Task < ApplicationRecord
  # validates_with TitleValidator
  validates :title, presence: true
  validates :description, presence: true
  validates :priority, presence: true, numericality: {less_than_or_equal_to: 3}

  scope :completed, -> {where(:isComplete => true)}
  scope :long_title, -> {where("LENGTH(title) > 20")}
end