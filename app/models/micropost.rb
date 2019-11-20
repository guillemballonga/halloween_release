class Micropost < ApplicationRecord
  
  belongs_to :user
  has_many :comments
  validates :description, length: { maximum: 140 },
                      presence: true
 validates :title, presence: true                    
 enum kind: [:bug, :enhancement, :proposal, :task]
 enum priority: [:trivial, :minor, :major, :critical, :blocker]
 enum status: [:new, :open, :resolved, :on_hold, :invalid, :duplicate, :wontfix, :closed]
end
