class Review < ApplicationRecord
  validates_presence_of :grossness, :scariness, :cleverness,
    :bigness, :badness, :monster_id, :user_id
  validates :grossness, :scariness, :cleverness, :bigness, :badness,
    numericality: true, inclusion: { in: 0..6 }
  belongs_to :user
  belongs_to :monster
  has_many :votes

  def upvotes
    my_votes = Vote.where(review_id: id, value: "+")
    my_votes.count
  end

  def downvotes
    my_votes = Vote.where(review_id: id, value: "-")
    my_votes.count
  end
end
