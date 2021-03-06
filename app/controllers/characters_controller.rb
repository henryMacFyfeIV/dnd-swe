class CharactersController < ApplicationController
   
    def new
        character = Character.new
        respond_to do |format|
            format.html {render :new, locals: {character: character}}
        end
    end

    def create
        
        character = Character.new(params.require(:character).permit(:name, :level, :background, :character_class, :race, :user_id, :strength, :dexterity, :constitution,
                                                                    :intelligence, :wisdom, :charisma, :lvl4feat, :lvl8feat, :lvl12feat, :lvl16feat, :lvl19feat, :description ))
        character.user_id = current_user.id
        
        respond_to do |format|
            format.html {  
                if character.save!
                    flash[:success] = "Saved your new character!"
                    puts character.background
                    redirect_to select_character_url
                else
                    puts "character.save failed"
                    flash.now[:error] = 'Error: rpg Character could not be updated'
                    render :new, locals: {character: character} 
                end
            }    
        end
        ConcreteWeapon.create!(count: 1, weapon_id: rand(1..5), character_id: character.id)
        ConcreteWeapon.create!(count: 1, weapon_id: rand(1..5), character_id: character.id)
        ConcreteItem.create!(count: rand(1..3), item_id: rand(1..10), character_id: character.id)
        ConcreteItem.create!(count: rand(1..3), item_id: rand(1..10), character_id: character.id)
        ConcreteItem.create!(count: rand(1..3), item_id: rand(1..10), character_id: character.id)
    end
    def edit
        character = Character.find(params[:id])
        respond_to do |format|
            format.html { render :edit, locals: { character: character } }
        end
    end
    def update
        character = Character.find(params[:id])
        respond_to do |format|
            format.html{
                if character.update(params.require(:character).permit(:name, :level, :background, :character_class, :race, :user_id, :strength, :dexterity, :constitution,
                                                                      :intelligence, :wisdom, :charisma, :lvl4feat, :lvl8feat, :lvl12feat, :lvl16feat, :lvl19feat, :description))
                    flash[:success] = 'Saved your updated character!'
                    redirect_to select_character_url
                else
                    flash[:error] = 'Error: rpg Character could not be updated'
                    render :edit, locals: {character: character} 
                end
            }
        end
    end
    def destroy
        character = Character.find(params[:id])
        name = character.name
        character.destroy
        respond_to do |format|
            format.html {
            flash[:success] = name + ' removed successfully'
            redirect_to select_character_url
            }
        end
    end
end


