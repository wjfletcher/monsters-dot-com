class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def home
    @monsters = Monster.all

    respond_to do |format|
      format.html
      format.json { render json: @monsters }
    end
  end

  def index
    if params[:sort_by] != nil
      search = params[:sort_by]
      @header = "Looking for " + search + " monsters"

      attribute_search = ""
      attribute_ascending = true

      case search
      when "cute"
        attribute_search = "grossness"
      when "ugly"
        attribute_search = "grossness"
        attribute_ascending = false
      when "silly"
        attribute_search = "scariness"
      when "scary"
        attribute_search = "scariness"
        attribute_ascending = false
      when "derpy"
        attribute_search = "cleverness"
      when "devious"
        attribute_search = "cleverness"
        attribute_ascending = false
      when "smol"
        attribute_search = "bigness"
      when "huge"
        attribute_search = "bigness"
        attribute_ascending = false
      when "good"
        attribute_search = "badness"
      when "evil"
        attribute_search = "badness"
        attribute_ascending = false
      end

      all_monsters = Monster.all
      @monsters = all_monsters.sort do |a, b|
        if a.send(attribute_search) == "?"
          1
        elsif b.send(attribute_search) == "?"
          -1
        elsif attribute_ascending
          a.send(attribute_search) <=> b.send(attribute_search)
        else
          b.send(attribute_search) <=> a.send(attribute_search)
        end
      end
    else
      @header = "Monsters (by name)"
      @monsters = Monster.order(:name)
    end

    respond_to do |format|
      format.html
      format.json { render json: @monsters }
    end
  end

  def show
    @reviews = @monster.reviews
    @vote = Vote.new
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.img.empty?
      @monster.img = "https://www.acefitness.org/myace/images/contactimage/no_phototn.jpg"
    end
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
  end

  def update

    if @monster.update(monster_params)
      redirect_to @monster, notice: (@monster.name + " was successfully updated.")
    else
      render :edit
    end
  end

  def destroy
    if !user_signed_in?
      flash[:notice] = "You are not authorized to delete this monster"
      render :edit
    elsif current_user.id == @monster.user_id || current_user.admin?
      @monster.destroy
      redirect_to monsters_url, notice: 'Monster was successfully destroyed.'
    else
      flash[:notice] = "You are not authorized to delete this monster"
      render :edit
    end
  end

  private

  def set_monster
    @monster = Monster.find(params[:id])
  end

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
