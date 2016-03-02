require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:items) }

  let(:my_user) { create(:user, email: "caroline@example.com") }
  let(:another_user) { create(:user, email: "BingBangBong@example.com") }

  describe "user#name" do
    it "should return the username part of the email, capitalized" do
      expect(my_user.name).to eq("Caroline")
      expect(another_user.name).to eq("Bingbangbong")
    end
  end
end
