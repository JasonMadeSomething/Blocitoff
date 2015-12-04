class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :user, presence: true
  before_save {self.state ||= :active }
  
  enum state: [:active, :completed, :archived]
end
