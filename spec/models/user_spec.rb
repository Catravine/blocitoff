require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:lists) }
  let(:my_user) { create(:user, email: "caroline@example.com") }


  describe "user#name" do
    it "should return the username part of the email, capitalized" do
      expect(my_user.name).to eq("Caroline")
    end
  end
end
