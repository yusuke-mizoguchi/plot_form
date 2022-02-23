class CharactersController < ApplicationController
  before_action :set_character

  def new
    @character = Character.new
  end

  def create
    @character = current_user.characters.build(character_params)
    @character.save
  end

  def edit; end

  def update
    @character = current_user.characters.find(params[:id])
    @character.update(character_params)
    redirect_to @character
  end

  def show
    @character = Character.find(params[:id])
  end

  private

  def character_params
    params.require(:character).permit(:body).merge(novel_id: params[:novel_id])
  end

  def set_character
    @character = @novel.characters.find(params[:id])
  end
end
