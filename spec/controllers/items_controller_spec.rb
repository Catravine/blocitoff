require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }
  let(:my_item) { create(:item, list: my_list) }

  context "guest user" do

    describe "GET #create" do
      it "should redirect to login" do
        post :create, list_id: my_list.id, item: { name: "test to-do not logged in" }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE #destroy" do
      it "should redirect to login" do
        delete :destroy, format: :js, id: my_item.id
        expect(response).to have_http_status(401)
      end
    end
  end

  context "signed in user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "GET #create" do
      it "increases the number of Items by 1" do
        expect{ post :create, list_id: my_list.id, item: { name: "test to-do count" }}.to change(Item,:count).by(1)
      end

      it "assigns the new item to @item" do
        post :create, list_id: my_list.id, item: { name: "test to-do" }
        expect(assigns(:item)).to eq Item.last
      end

      it "redirects to user's profile" do
        post :create, list_id: my_list.id, item: { name: "test to-do redirect" }
        expect(response).to redirect_to "where_i_came_from"
      end
    end

    describe "DELETE #destroy" do
      it "deletes the item" do
        delete :destroy, format: :js, id: my_item.id
        count = Item.where({id: my_item.id}).size
        expect(count).to eq 0
      end

      it "returns http success" do
        delete :destroy, id: my_item.id
        expect(response).to have_http_status(:success)
      end
    end
  end

end
