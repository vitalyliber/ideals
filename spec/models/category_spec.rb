require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'create category' do
    category = Category.new(name: 'xxx')
    expect(category.save).to eq(true)
    expect(category.products_count).to eq(0)
  end

  it 'get validation errors' do
    category = Category.new(name: '')
    expect(category.save).to eq(false)
    errors = category.errors.full_messages
    expect(errors[0]).to eq("Name can't be blank")
    expect(errors[1]).to eq("Name is too short (minimum is 3 characters)")
  end
end
