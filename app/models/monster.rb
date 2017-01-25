class Monster < ApplicationRecord
  validates_presence_of :name, :img, :source, :user_id
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def grossness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    unless my_reviews.length == 0
      my_reviews.each do |review|
        total += review.grossness
      end
      my_score = (total / my_reviews.length)
    else
      my_score = "?"
    end
  end

  def scariness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    unless my_reviews.length == 0
      my_reviews.each do |review|
        total += review.scariness
      end
      my_score = (total / my_reviews.length)
    else
      my_score = "?"
    end
  end

  def cleverness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    unless my_reviews.length == 0
      my_reviews.each do |review|
        total += review.cleverness
      end
      my_score = (total / my_reviews.length)
    else
      my_score = "?"
    end
  end

  def bigness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    unless my_reviews.length == 0
      my_reviews.each do |review|
        total += review.bigness
      end
      my_score = (total / my_reviews.length)
    else
      my_score = "?"
    end
  end

  def badness
    my_reviews = Review.where(monster_id: self.id)
    total = 0
    unless my_reviews.length == 0
      my_reviews.each do |review|
        total += review.badness
      end
      my_score = (total / my_reviews.length)
    else
      my_score = "?"
    end
  end

end
