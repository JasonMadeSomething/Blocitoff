require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:item) { create(:item) }
  
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  
  describe "attributes" do
    it "should respond to name" do
      expect(item).to respond_to(:name)
    end
    
    it "should respond to state" do
      expect(item).to respond_to(:state)
    end
    
    it "should respond to active?" do
      expect(item).to respond_to(:active?)
    end
    
    it "should respond to completed?" do
      expect(item).to respond_to(:completed?)
    end
    
    it "should respond to archived?" do
      expect(item).to respond_to(:archived?)
    end
  end
  
  describe "states" do
    it "should be active by default" do
      expect(item.state).to eq("active")
    end
    
    context "active item" do
      it "should return true for #active?" do
        expect(item.active?).to be_truthy
      end
      
      it "should return false for #completed?" do
        expect(item.completed?).to be_falsey
      end
      
      it "should return false for #archived?" do
        expect(item.archived?).to be_falsey
      end
    end
    
    context "completed item" do
      before { item.completed! }
      
      it "should return true for #completed?" do
        expect(item.completed?).to be_truthy
      end
      
      it "should return false for #archived?" do
        expect(item.archived?).to be_falsey
      end
      
      it "should return false for #active?" do
        expect(item.active?).to be_falsey
      end
    end
    
    context "archived item" do
      before { item.archived! }
      
      it "should return true for #archived?" do
        expect(item.archived?).to be_truthy
      end
      
      it "should return false for #active?" do
        expect(item.active?).to be_falsey
      end
      
      it "should return false for #completed?" do
        expect(item.completed?).to be_falsey
      end
    end
  end
end
