class Micropost < ApplicationRecord
  
  belongs_to :user
  has_many :comments
  has_many :uploads, dependent: :destroy
 # validates :description, length: { maximum: 140 },
  #                    presence: true
 validates :title, presence: true                    
 enum kind: [:bug, :enhancement, :proposal, :task]
 enum priority: [:trivial, :minor, :major, :critical, :blocker]
 enum status: [:st_new, :open, :resolved, :on_hold, :st_invalid, :duplicate, :wontfix, :closed]
 
 #votes
 acts_as_votable
end
