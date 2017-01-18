class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end

  def show
    @monster = Monster.find(params[:id])
    # @reviews = @monster.reviews
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      flash[:notice] = (@monster.name + " added successfully")
      redirect_to monster_path(@monster)
    else
      flash[:notice] = @monster.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def monster_params
    params.require(:monster).permit(
      :name,
      :source,
      :img,
      :description,
      :email
    )
  end

end
