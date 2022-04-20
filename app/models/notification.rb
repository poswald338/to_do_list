# create_table "notifications", force: :cascade do |t|
#   t.string "title"
#   t.text "note"
#   t.boolean "viewed"
#   t.integer "sender_id"
#   t.integer "recipient_id"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.integer "user_id"
# end

class Notification < ApplicationRecord 
  belongs_to :user

  validates :title, presence: true
  validates :note, presence: true
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
end