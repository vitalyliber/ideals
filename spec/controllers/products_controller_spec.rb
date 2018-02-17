require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:category) { create :category }
  let(:product) { create :product, category: category }

  it "returns list of products" do
    create :product, category: category
    get :index, { params: { category_id: category.id } }
    expect(response).to be_successful
    category = JSON.parse(response.body).first
    expect(category['id']).to be_present
    expect(category['name']).to be_present
    expect(category['price']).to eq('49.99')
  end

  it "create new product" do
    post :create, {
      params: {
        category_id: category.id,
        product: { name: 'Espresso', price: 49.99 }
      }
    }
    expect(response).to be_successful
    category = JSON.parse(response.body)
    expect(category['id']).to be_present
    expect(category['name']).to eq('Espresso')
    expect(category['price']).to eq('49.99')
  end

  it "get validation errors" do
    post :create, {
      params: {
        category_id: category.id,
        product: { name: '', price: 49.99 }
      }
    }
    expect(response).to have_http_status(:unprocessable_entity)
    errors = {errors: {name: ["can't be blank", "is too short (minimum is 3 characters)"]}}.to_json
    expect(response.body).to eq(errors)
  end

  it "delete a product" do
    delete :destroy, {
      params: { id: product.id }
    }
    expect(response).to have_http_status(:no_content)
  end

  it "get active record error" do
    delete :destroy, {
        params: { id: 123 }
    }
    expect(response).to have_http_status(:not_found)
  end
end
