require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:lists) }
  let(:my_user) { create(:user, email: "caroline@example.com") }


  describe "user#name" do
    it "should return the username part of the email, capitalized" do
      expect(my_user.name).to eq("Caroline")
    end
  end

  describe "user#total_items" do
    it "returns the total number of items for all user's lists" do
      list1 = create(:list, user: my_user)
      list2 = create(:list, user: my_user)
      item1 = create(:item, list: list1)
      item2 = create(:item, list: list1)
      item3 = create(:item, list: list1)
      item4 = create(:item, list: list2)
      item5 = create(:item, list: list2)
      expect(my_user.total_items).to eq(5)
    end
  end

  describe "user#generate_auth_token" do
    it "creates a token" do
      expect(my_user.auth_token).to_not be_nil
    end
  end

end
