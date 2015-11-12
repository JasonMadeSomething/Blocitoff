require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #home" do
    before { get :home }
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "renders the home template" do
      expect(response).to render_template("home")
    end
  end

end
