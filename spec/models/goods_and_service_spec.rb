require 'rails_helper'

RSpec.describe UserInformation, type: :model do
  # Let's say you have the following setup:
  let!(:person1) { UserInformation.create!(user_id: "1234", username: "person 1", name: "A", friends: [], password: "defaultPassword", password_confirmation: "defaultPassword") }
  let!(:person2) { UserInformation.create!(user_id: "2345", username: "person 2", name: "B", friends: ['1234'], password: "defaultPassword", password_confirmation: "defaultPassword") }
  let!(:person3) { UserInformation.create!(user_id: "3456", username: "person 3", name: "C", friends: ['1234', '2345'], password: "defaultPassword", password_confirmation: "defaultPassword") }


  describe '#validate_friends_array' do
    it "returns early when 'friends' is empty" do

        allow(person2).to receive(:friends).and_return([])
        result = person2.validate_friends_array
        expect(result).to be_nil
    end

    it "performs some action when 'friends' is not empty" do
        # Stub the 'friends' method to return a non-empty array
        allow(person3).to receive(:friends).and_return(['1234', '2345'])
    end
  end
end 

RSpec.describe GoodsAndService, type: :model do
    let!(:item1)   { GoodsAndService.create!(user_id: "1234", name: "item1", category: 0, description: "A")}
    let!(:item2)   { GoodsAndService.create!(user_id: "1234", name: "item2", category: 1, description: "B")}

    
    describe ".all_categories" do
        it "returns an array of category names" do
          categories = GoodsAndService.all_categories
          expect(categories).to match_array(['Good', 'Service'])
        end
    end

    describe ".with_categories" do
        it "returns records with the specified categories" do
            # Perform a query with the 'with_categories' method
            result = GoodsAndService.with_categories(['Good'])
    
            # Expectations
            expect(result).to include(item1)
            expect(result).not_to include(item2)
        end
    end
end
