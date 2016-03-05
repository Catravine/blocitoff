require 'rails_helper'

RSpec.describe List, type: :model do
  let(:my_user) { create(:user) }
  let(:my_list) { create(:list, user: my_user) }

  it { should belong_to(:user) }
  it { should have_many(:items) }

  describe "attributes" do
    it "should respond to title" do
      expect(my_list).to respond_to(:title)
    end

    it "should titleize titles" do
      my_other_list = create(:list, user: my_user, title: "list test")
      expect(my_other_list.title).to eq("List Test")
    end
  end

  describe "#number_of_items" do
    before do
      item1 = create(:item, list: my_list)
      item2 = create(:item, list: my_list)
      item3 = create(:item, list: my_list)
    end
    it "returns the number of items in the list" do
      expect(my_list.number_of_items).to eq(3)
    end
  end
end
