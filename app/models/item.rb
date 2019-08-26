class Item < ApplicationRecord
  belongs_to :user
  NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"] # or any other attribute that does not need validation
  VALIDATABLE_ATTRS = Item.attribute_names.reject { |attr| NON_VALIDATABLE_ATTRS.include?(attr) }
  validates_presence_of VALIDATABLE_ATTRS
  validates :sold, default: false
end
