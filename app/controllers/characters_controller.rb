class CharactersController < ApplicationController

    def new
        character = Character.new
        respond_to do |format|
            format.html {render :new, locals: {character: character}}
        end
    end

    def create
        
        character = Character.new(params.require(:character).permit(:background, :character_class, :race, :user_id ))
        character.user_id = current_user.id
        puts "CURRENT USER ID"
        puts current_user.id
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
    end
end


