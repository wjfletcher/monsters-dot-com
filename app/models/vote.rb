class Vote < ApplicationRecord
  validates_presence_of :review_id, :user_id, :value
  validates :value, inclusion: { in: %w(+ -) }
  belongs_to :user
  belongs_to :review
end
