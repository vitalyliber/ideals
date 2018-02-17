require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  it "returns list of categories" do
    create :category
    get :index
    expect(response).to be_successful
    category = JSON.parse(response.body).first
    expect(category['id']).to be_present
    expect(category['name']).to be_present
    expect(category['products_count']).to eq(0)
  end

  it "create new category" do
    post :create, { params: { category: { name: 'Candy' } } }
    expect(response).to be_successful
    category = JSON.parse(response.body)
    expect(category['id']).to be_present
    expect(category['name']).to eq('Candy')
    expect(category['products_count']).to eq(0)
  end

  it "get validation errors" do
    post :create, { params: { category: { name: '' } } }
    expect(response).to have_http_status(:unprocessable_entity)
    errors = {errors: {name: ["can't be blank", "is too short (minimum is 3 characters)"]}}.to_json
    expect(response.body).to eq(errors)
  end
end
