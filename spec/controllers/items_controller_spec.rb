require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_item) { create(:item, user: my_user) }

  context "guest user" do

    describe "GET #create" do
      it "should redirect to login/index" do
        post :create, user_id: my_user.id, item: { name: "test to-do not logged in" }
        expect(response).to redirect_to root_path
      end
    end

    describe "DELETE #destroy" do
      it "should redirect to login/index" do
        delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context "signed in user" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "GET #create" do
      it "increases the number of Items by 1" do
        expect{ post :create, user_id: my_user.id, item: { name: "test to-do count" }}.to change(Item,:count).by(1)
      end

      it "assigns the new item to @item" do
        post :create, user_id: my_user.id, item: { name: "test to-do" }
        expect(assigns(:item)).to eq Item.last
      end

      it "redirects to user's profile" do
        post :create, user_id: my_user.id, item: { name: "test to-do redirect" }
        expect(response).to redirect_to my_user
      end
    end

    describe "DELETE #destroy" do
      it "deletes the item" do
        delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
        count = Item.where({id: my_item.id}).size
        expect(count).to eq 0
      end

      it "returns http success" do
        delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
        expect(response).to have_http_status(:success)
      end
    end
  end

end
