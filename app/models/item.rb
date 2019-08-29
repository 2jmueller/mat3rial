class Item < ApplicationRecord
  belongs_to :user
  # NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"] # or any other attribute that does not need validation
  # VALIDATABLE_ATTRS = Item.attribute_names.reject { |attr| NON_VALIDATABLE_ATTRS.include?(attr) }
  # validates_presence_of VALIDATABLE_ATTRS
  has_many :transactions
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :sold, default: false
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  ITEM_TYPES = %w[Tools Electronic Paper Stationary Paint Other]
end
