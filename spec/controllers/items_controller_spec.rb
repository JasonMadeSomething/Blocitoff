require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) {create(:user)}
  let(:test_item) {create(:item, user: user)}
  
  before do
    user.confirm
    sign_in user
  end
  
  describe "POST create" do
    
    it "increases the number of items by 1" do
      expect{ post :create, format: :js, user_id: user.id, item: {name: "Test task" } }.to change(Item, :count).by(1)
    end
    
    it "returns http success" do
      post :create, format: :js, user_id: user.id, item: {name: "Test task" }
      expect(response).to have_http_status(:success)
    end
    
  end

end
