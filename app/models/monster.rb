class Monster < ApplicationRecord
  validates_presence_of :name, :img, :source
end
