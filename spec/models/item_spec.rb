require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:my_user) { create(:user) }
  let(:my_item) { create(:item, user: my_user) }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "should respond to name" do
      expect(my_item).to respond_to(:name)
    end
  end
end
