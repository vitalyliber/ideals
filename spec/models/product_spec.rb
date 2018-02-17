require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'create product' do
    product = Product.new(name: 'xxx', price: 11.99)
    product.build_category(name: 'yyy')
    expect(product.save).to be(true)
    expect(product.category).to be_present
    expect(product.category.products_count).to eq(1)
  end

  it 'get validation errors' do
    product = Product.new(name: '', price: 0)
    product.build_category(name: 'yyy')
    expect(product.save).to be(false)
    errors = product.errors.full_messages
    expect(errors).to be_present
    expect(errors[0]).to eq("Name can't be blank")
    expect(errors[1]).to eq("Name is too short (minimum is 3 characters)")
    expect(errors[2]).to eq("Price must be greater than 0")
  end
end
