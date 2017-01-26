class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: @review.monster.user.email,
      subject: "New Review for #{@review.monster.name}"
    )
  end
end
