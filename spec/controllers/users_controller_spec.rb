require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {create(:user)}
  
  context "guest" do
    describe "GET #show" do
      it "redirects to sign in" do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  context "signed in user" do
    before do
      user.confirm
      sign_in user
      get :show
    end
    describe "GET #show" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #show view" do
        expect(response).to render_template :show
      end
      
      it "assigns current user to @user" do
        expect(assigns(:user)).to eq(user)
      end
    end
  end
end
