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
    # needs to check feats/race/traits/items to determin attribute bonus.
    character1 = Character.find(params[:id])
    strength_modifier = 0
    dexterity_modifier = 0
    constitution_modifier = 0
    intelligence_modifier = 0
    wisdom_modifier = 0
    charisma_modifier = 0
    if character1.level >= 19
      feats = [ character1.lvl4feat, character1.lvl8feat, character1.lvl12feat, character1.lvl16feat, character1.lvl19feat ]
    elsif character1.level >= 16
      feats = [ character1.lvl4feat, character1.lvl8feat, character1.lvl12feat, character1.lvl16feat ]
    elsif character1.level >= 12
      feats = [ character1.lvl4feat, character1.lvl8feat, character1.lvl12feat ]
    elsif character1.level >= 8
      feats = [ character1.lvl4feat, character1.lvl8feat ]
    elsif character1.level >= 4
      feats = [ character1.lvl4feat ]
    else
      feats = []
    end
    feat_list = []
    for feat in feats do
      if ['Athlete (Strength)', 'Heavily Armored', 'Heavy Armor Master', 'Lightly Armored (Strength)', 'Moderately Armored (Strength)', 'Tavern Brawler (Strength)', 'Weapon Master (Strength)'].include? feat
        strength_modifier += 1
      elsif ['Athlete (Dexterity)', 'Lightly Armored (Dexterity)', 'Moderately Armored (Dexterity)', 'Weapon Master (Dexterity)'].include? feat
        dexterity_modifier += 1
      elsif ['Durable', 'Tavern Brawler (Constitution)']
        constitution_modifier += 1
      elsif ['Keen Mind', 'Linguist', 'Observant (Intelligence)']
        intelligence_modifier += 1
      elsif 'Observant (Wisdom)' == feat
        wisdom_modifier += 1
      elsif 'Actor' == feat
        charisma_modifier += 1
      end
      feat_list.push(Feat.find_by name: feat)
    end
    modifiers = [strength_modifier, dexterity_modifier, constitution_modifier, intelligence_modifier, wisdom_modifier, charisma_modifier]
    respond_to do |format|
      format.html {render:view_character, locals: {character1: character1, modifiers: modifiers, feat_list: feat_list}}
    end
  end
  
end
