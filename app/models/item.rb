class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :user, presence: true
  before_save {self.state ||= :active }
  
  enum state: [:active, :completed, :archived]
  
  
  def activate
    self.state = :active
    self.activated_at = Date.today
    self.deactivated_at = nil
  end
  
  def deactivate(new_state)
    self.state = new_state
    self.deactivated_at = Date.today
  end
end
