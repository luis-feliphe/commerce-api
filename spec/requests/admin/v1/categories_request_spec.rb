require 'rails_helper'

RSpec.describe "Admin::V1::Categories", type: :request do
    let(:user) { create(:user) }

    context "GET /categories" do
        let(:url) { "/admin/v1/categories"}
        let!(:categories) { create_list(:category, 5) }
        

        it "return all categories" do 
            get url, headers: auth_header(user)
            expect(body_json['categories']).to containing_exactly *categories.as_json(only: %i(id name))
        end
        
        it "return success status" do 
            get url, headers: auth_header(user)
            expect(response).to have_http_status(:ok)
        end
    end

    context "POST /categories" do
        let(:url) { "/admin/v1/categories"}
        context "With valid parameters" do
            let(:category_params) {{category: attributes_for(:category)}.to_json}

            it "add a new category" do
                expect do 
                    post url , headers: auth_header(user), params: category_params
                end.to change(Category, :count).by(1)                
            end

            it "return last category added" do
                expect do 
                    post url , headers: auth_header(user), params: category_params
                    expected_category = Category.last.as_json(only: %i(id name))
                    expect(body_json['category']).to eq expected_category
                end               
            end
            it "return success status" do 
                post url , headers: auth_header(user), params: category_params
                expect(response).to have_http_status(:success)
            end
        end

        context "With invalid parameters" do
            let(:category_invalid_params) do 
                {category: attributes_for(:category, name: nil )}.to_json
            end

            it "does not add a new category" do 
                expect do 
                    post url , headers: auth_header(user) , params: category_invalid_params
                end.to_not change(Category, :count)
            end
            
            it "return error messages" do 
                post url , headers: auth_header(user) , params: category_invalid_params
                expect(body_json['errors']['fields']).to have_key('name')
            end

            it "return unprocessable entity" do
                post url , headers: auth_header(user) , params: category_invalid_params
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end
