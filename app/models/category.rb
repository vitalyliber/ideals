class Category < ApplicationRecord
  include CommonValidation
  has_many :products
end
