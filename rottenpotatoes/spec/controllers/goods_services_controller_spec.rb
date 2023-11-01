require 'rails_helper'

RSpec.describe GoodsServicesController, type: :model do
    # Let's say you have the following setup:
    let!(:person1) { UserInformation.create!(user_id: "1234", username: "person 1", name: "A", friends: []) }
    let!(:person2) { UserInformation.create!(user_id: "2345", username: "person 2", name: "B", friends: ['1234']) }
    let!(:person3) { UserInformation.create!(user_id: "3456", username: "person 3", name: "C", friends: ['1234', '2345']) }

    let!(:item1)   { GoodsAndService.create!(user_id: "1234", name: "item1", category: 0, description: "A")}
    let!(:item2)   { GoodsAndService.create!(user_id: "1234", name: "item2", category: 1, description: "B")}

    describe 'PUT #update' do
        it 'updates the good/service' do
            put :update, user_id: item1.user_id, item1: { name: "Updated Name" }
            item1.reload
            expect(item1.name).to eq("Updated Name")
        end
    end

    describe 'DELETE #destroy' do
        it 'deletes the good/service' do
        expect {
            delete :destroy, user_id: item1.user_id
        }.to change(GoodsAndService, :count).by(-1)
        end
    end
end