require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }
  let(:my_item) { create(:item, list: my_list) }
  
  it { should belong_to(:list) }

  describe "attributes" do
    it "should respond to name" do
      expect(my_item).to respond_to(:name)
    end
  end

  describe "item#finish_or_delete_by" do
    it "creates a due date based on created_at date" do
      expect(my_item.finish_or_delete_by).to eq(7.days.from_now.to_date)
    end
  end
end
