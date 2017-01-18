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
    @monster.user_id = current_user.id
    if @monster.save
      flash[:notice] = (@monster.name + " added successfully.")
      redirect_to monster_path(@monster)
    else
      flash[:notice] = @monster.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    @monster = Monster.find(params[:id])

    if @monster.update(monster_params)
      redirect_to @monster, notice: (@monster.name + " was successfully updated.")
    else
      render :edit
    end
  end

  def destroy
    @monster = Monster.find(params[:id])
    name = @monster.name
    # @monster.reviews = nil
    @monster.destroy
    redirect_to monsters_url, notice: 'Monster was successfully destroyed.'
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
