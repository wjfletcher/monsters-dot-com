class Monster < ApplicationRecord
  validates_presence_of :name, :img, :source, :user_id
  belongs_to :user
  has_many :reviews, :dependent => :destroy
end
