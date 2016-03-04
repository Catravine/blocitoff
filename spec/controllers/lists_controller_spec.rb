require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }

  context "guest user" do

    describe "GET #create" do
      it "should redirect to login" do
        post :create, user_id: my_user.id, list: { title: "Guest User List" }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE #destroy" do
      it "should redirect to login" do
        delete :destroy, id: my_list.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "signed in user" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "GET #create" do
      it "increases the number of Lists by 1" do
        expect{ post :create, user_id: my_user.id, list: { title: "test list count" }}.to change(List,:count).by(1)
      end

      it "assigns the new list to @list" do
        post :create, user_id: my_user.id, list: { title: "test list" }
        expect(assigns(:list)).to eq List.last
      end

      it "redirects to user's profile" do
        post :create, user_id: my_user.id, list: { title: "new list redirect" }
        expect(response).to redirect_to my_user
      end
    end

    describe "DELETE #destroy" do
      it "deletes the list" do
        delete :destroy, id: my_list.id
        count = List.where({id: my_list.id}).size
        expect(count).to eq 0
      end

      it "returns http success" do
        delete :destroy, id: my_list.id
        expect(response).to have_http_status(:success)
      end
    end
  end

end
