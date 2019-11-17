class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  def home
    respond_to do |format|
      format.html { render:home }
    end
  end

  def create_an_account
    respond_to do |format|
      format.html { render:create_an_account }
    end
  end
  #should notify user that account created successfully
  def create_account
    required = [:username, :password]
    form_complete = true
    required.each do |f|
      if params.has_key? f and not params[f].blank?
        # do nothing
      else
        form_complete = false
      end
    end
    if form_complete
      form_status_msg = 'Account Created'
    else
      form_status_msg = 'Account not created'
    end
    respond_to do |format|
      format.html { render:home }
    end
  end
  def select_character
    params[:character_id]
    characters = Character.where(user_id: current_user)
    respond_to do |format|
      format.html {render:select_character, locals: {characters: characters}}
    end
  end
  def select_abilities
    respond_to do |format|
      format.html {render:select_abilities}
    end
  end
  def view_character
    character1 = Character.find(params[:id])
    respond_to do |format|
      format.html {render:view_character, locals: {character1: character1}}
    end
  end
end
