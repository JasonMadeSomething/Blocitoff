class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :user_name, :email, presence: true
  validates :user_name, :email, uniqueness: true
  validates :email, length: { minimum: 3 }
  validates :user_name, length: { minimum: 1 }
end
