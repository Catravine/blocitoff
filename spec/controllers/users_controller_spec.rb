require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:my_user) { create(:user) }

  context "guest user" do
    describe "GET show" do
      it "redirects to login/index" do
        get :show, {id: my_user.id}
        expect(response).to redirect_to root_path
      end
    end
  end

  context "signed in user" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end
    describe "GET show" do
      it "returns http success" do
        get :show, {id: my_user.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: my_user.id}
        expect(response).to render_template :show
      end

      it "assigns my_user to @user" do
        get :show, {id: my_user.id}
        expect(assigns(:user)).to eq(my_user)
      end
    end
  end

end
