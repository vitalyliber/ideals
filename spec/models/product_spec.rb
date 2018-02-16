require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'create product' do
    product = Product.new(name: 'xxx')
    product.build_category(name: 'yyy')
    expect(product.save).to be(true)
    expect(product.category).to be_present
    expect(product.category.products_count).to eq(1)
  end

  it 'get validation errors' do
    product = Product.new(name: '')
    product.build_category(name: 'yyy')
    expect(product.save).to be(false)
    errors = product.errors.full_messages
    expect(errors).to be_present
    expect(errors[0]).to eq("Name can't be blank")
    expect(errors[1]).to eq("Name is too short (minimum is 3 characters)")
  end
end
