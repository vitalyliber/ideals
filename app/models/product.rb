class Product < ApplicationRecord
  include CommonValidation
  belongs_to :category, counter_cache: true
end
