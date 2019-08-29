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
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_category,
    against: [
      [:title, 'A'],
      [:category, 'B'],
      [:description, 'C']
    ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  ITEM_TYPES = %w[Tools Electronic Paper Stationary Paint Other]
end
