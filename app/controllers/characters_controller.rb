class CharactersController < ApplicationController
    def new
        character = Character.new
        respond_to do |format|
            format.html {render :new, locals: {character: character}}
        end
    end

    def create
        character = Character.new(params.require(:character).permit(:name, :background))
        respond_to do |format|
            format.html {  
                if 
                    puts character.background
                    flash[:success] = "Saved your new character!"
                    redirect_to select_character_url
                else
                    flash.now[:error] = 'Error: rpg Character could not be updated'
                    render :new, locals: {character: character} 
                end
            }    
        end
    end
end


