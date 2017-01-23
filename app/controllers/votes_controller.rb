class VotesController < ApplicationController
  before_action :set_review
  before_action :set_monster

  def handle_vote
    matching_votes = Vote.where(user_id: current_user.id, review_id: @review.id)
    vote_value = params[:value]
    if matching_votes.empty?
      @vote = Vote.new(user_id: current_user.id, review_id: @review.id, value: vote_value)
      if @vote.save
        flash[:notice] = "Vote added successfully."
      else
        flash[:notice] = @vote.errors.full_messages.to_sentence
      end
    elsif matching_votes.first.value == vote_value
      matching_votes.first.delete
      flash[:notice] = "Vote removed."
    else
      matching_votes.first.value = vote_value
      matching_votes.first.save
      flash[:notice] = "Vote successfully changed."
    end
    redirect_to @monster
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_monster
    @monster = Monster.find(params[:monster_id])
  end
end
