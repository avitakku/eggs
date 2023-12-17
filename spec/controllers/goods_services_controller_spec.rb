require 'rails_helper'

RSpec.describe GoodsServicesController, type: :controller do
  before do
    UserInformation.delete_all
    GoodsAndService.delete_all
  end

  let!(:person1) { UserInformation.create!(user_id: "1234", username: "person 1", name: "A", contact_information: "test@columbia.edu", friends: [], password: "defaultPassword", password_confirmation: "defaultPassword") }
  let!(:person2) { UserInformation.create!(user_id: "2345", username: "person 2", name: "B", contact_information: "test2@columbia.edu", friends: ['1234'], password: "defaultPassword", password_confirmation: "defaultPassword") }
  let!(:person3) { UserInformation.create!(user_id: "3456", username: "person 3", name: "C", contact_information: "test3@columbia.edu", friends: ['2345'], password: "defaultPassword", password_confirmation: "defaultPassword") }

  let!(:item1) { GoodsAndService.create!(user_id: "1234", name: "item1", category: 0, description: "A")}
  let!(:item2) { GoodsAndService.create!(user_id: "1234", name: "item2", category: 1, description: "B")} 

  describe 'GET index' do
    before do
      session[:user_id] = person1.user_id 
    end

    context 'when a search query is present' do
    it 'filters goods and services based on the query' do
      get :index, params: { query: 'item1' }
        expect(assigns(:goods_services)).to include(item1)
        expect(assigns(:goods_services)).to include(item2)
      end
    end

    context 'when user has second-degree connections' do
      before do
        session[:user_id] = person3.user_id 
      end

      it 'includes second-degree connections' do
        get :index
          expect(assigns(:second_degree_connections)).to include(person1.user_id)
        end
      end
  end
  end