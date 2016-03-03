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
  end
end
