class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :products_count
end
