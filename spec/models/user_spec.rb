require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit.com").for(:email) }
  
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  it { should validate_presence_of(:user_name) }
  it { should validate_length_of(:user_name).is_at_least(1) }
  
  it { should have_many(:items) }
  
  describe "attributes" do
    
    it "should respond to user_name" do
      expect(user).to respond_to(:user_name)
    end
    
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
  end
end
