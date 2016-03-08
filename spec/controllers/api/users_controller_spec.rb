require 'rails_helper'

 RSpec.describe Api::UsersController, type: :controller do
   let(:my_user) { create(:user) }

   context "unauthenticated users" do
     it "GET index returns http unauthenticated" do
       get :index, format: :json
       expect(response).to have_http_status(401)
     end

     it "GET show returns http unauthenticated" do
       get :show, id: my_user.id, format: :json
       expect(response).to have_http_status(401)
     end
   end

   context "authenticated users" do
     before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       sign_in my_user
     end

     describe "GET index" do
       before { get :index }

       it "returns http success" do
         expect(response).to have_http_status(:success)
       end

       it "returns json content type" do
         expect(response.content_type).to eq("application/json")
       end

       it "returns my_user serialized" do
         expect(response.body).to eq([my_user].to_json)
       end
     end

     describe "GET show" do
       before { get :show, id: my_user.id }

       it "returns http success" do
         expect(response).to have_http_status(:success)
       end

       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end

       it "returns my_user serialized" do
         expect(response.body).to eq(my_user.to_json)
       end
     end
   end
 end
