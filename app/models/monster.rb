class Monster < ApplicationRecord
  validates_presence_of :name, :img, :source, :user_id
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def grossness
    my_reviews = Review.where(monster_id: id)
    total = 0
    if my_reviews.empty?
      "?"
    else
      my_reviews.each do |review|
        total += review.grossness
      end
      (total / my_reviews.length)
    end
  end

  def scariness
    my_reviews = Review.where(monster_id: id)
    total = 0
    if my_reviews.empty?
      "?"
    else
      my_reviews.each do |review|
        total += review.scariness
      end
      (total / my_reviews.length)
    end
  end

  def cleverness
    my_reviews = Review.where(monster_id: id)
    total = 0
    if my_reviews.empty?
      "?"
    else
      my_reviews.each do |review|
        total += review.cleverness
      end
      (total / my_reviews.length)
    end
  end

  def bigness
    my_reviews = Review.where(monster_id: id)
    total = 0
    if my_reviews.empty?
      "?"
    else
      my_reviews.each do |review|
        total += review.bigness
      end
      (total / my_reviews.length)
    end
  end

  def badness
    my_reviews = Review.where(monster_id: id)
    total = 0
    if my_reviews.empty?
      "?"
    else
      my_reviews.each do |review|
        total += review.badness
      end
      (total / my_reviews.length)
    end
  end

end
