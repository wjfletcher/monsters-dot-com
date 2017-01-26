class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_monster

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.monster = @monster
    @review.user_id = current_user.id
    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      flash[:notice] = ("Rating added successfully.")
      redirect_to @monster
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])

    if !user_signed_in?
      redirect_to monster_path(@review.monster_id), notice: "Please sign in to edit reviews"
    elsif @review.user_id != current_user.id
      redirect_to monster_path(@review.monster_id), notice: "You are not the author of this review"
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @monster, notice: "Rating was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @monster, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_monster
    @monster = Monster.find(params[:monster_id])
  end

  def review_params
    params.require(:review).permit(
      :grossness,
      :scariness,
      :cleverness,
      :bigness,
      :badness,
      :body
    )
  end

end
