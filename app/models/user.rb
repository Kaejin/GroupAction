class User < ApplicationRecord
  has_many :event_donations
  has_many :direct_donations
  has_many :events
  has_many :fundraisers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
