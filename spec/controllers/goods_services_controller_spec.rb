require 'rails_helper'

RSpec.describe GoodsServicesController, type: :controller do
    before do
      UserInformation.delete_all
      GoodsAndService.delete_all
    end
  
    let!(:person1) { UserInformation.create!(user_id: "1234", username: "person 1", name: "A", friends: []) }
    let!(:person2) { UserInformation.create!(user_id: "2345", username: "person 2", name: "B", friends: ['1234']) }
    let!(:person3) { UserInformation.create!(user_id: "3456", username: "person 3", name: "C", friends: ['2345']) }
  
    let!(:item1)   { GoodsAndService.create!(user_id: "1234", name: "item1", category: 0, description: "A")}
    let!(:item2)   { GoodsAndService.create!(user_id: "1234", name: "item2", category: 1, description: "B")} 
    
    before do
        @@logged_in_user = person1.user_id 
    end


  describe 'GET index' do
    context 'when a search query is present' do
      it 'filters goods and services based on the query' do
        get :index, params: { query: 'item1' }
        expect(assigns(:goods_services)).to include(item1)
        expect(assigns(:goods_services)).to include(item2)
      end
    end

    before do
        @@logged_in_user = person3.user_id 
    end
    context 'when user has second-degree connections' do
        it 'includes second-degree connections' do
          # Assuming person1 is the logged-in user
          # and person2 and person3 are first and second-degree connections respectively
          get :index
          expect(assigns(:second_degree_connections)).to include(person1.user_id)
        end
      end
  end  
  
end