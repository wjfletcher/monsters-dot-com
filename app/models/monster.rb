class Monster < ApplicationRecord
  validates_presence_of :name, :img, :source, :user_id
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def grossness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    my_reviews.each do |review|
      total += review.grossness
    end
    my_score = (total / my_reviews.length)
  end

  def scariness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    my_reviews.each do |review|
      total += review.grossness
    end
    my_score = (total / my_reviews.length)
  end

  def cleverness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    my_reviews.each do |review|
      total += review.cleverness
    end
    my_score = (total / my_reviews.length)
  end

  def bigness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    my_reviews.each do |review|
      total += review.bigness
    end
    my_score = (total / my_reviews.length)
  end

  def badness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    my_reviews.each do |review|
      total += review.badness
    end
    my_score = (total / my_reviews.length)
  end

end
