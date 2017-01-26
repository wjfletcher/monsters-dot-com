class Api::V1::MonstersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def home
    @monsters = Monster.all
    render json: @monsters
  end
end
