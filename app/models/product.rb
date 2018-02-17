class Product < ApplicationRecord
  include CommonValidation
  belongs_to :category, counter_cache: true
  validates :price, numericality: { greater_than: 0 }
end
