class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :status, inclusion: { in: %w(accepted decline pending),
    message: "%{value} is not a valid status" }
  validates :user_id, presence: true
  validates :item_id, presence: true
end
