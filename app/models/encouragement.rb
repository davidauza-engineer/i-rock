class Encouragement < ApplicationRecord
  belongs_to :user
  belongs_to :achievement
  
  validates :message, presence: true
end
