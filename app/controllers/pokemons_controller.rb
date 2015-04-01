class PokemonsController < ApplicationController
	
	def capture
		@pokemon = Pokemon.find(params[:id])
		@trainer = current_trainer
		@pokemon.trainer_id = @trainer.id
		@pokemon.save
		redirect_to root_path
	end

	def damage
  		@pokemon = Pokemon.find(params[:id])
  		@pokemon.health = @pokemon.health - 10
  		@pokemon.save
  		redirect_to trainer_path(id: @pokemon.trainer_id)
  	end

	def new
		@trainer = current_trainer
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(params.require(:pokemon).permit(:name))
		if @pokemon.save
		  @pokemon.level = 1
		  @pokemon.health = 100
		  @pokemon.trainer_id = current_trainer.id
		  @pokemon.save
		  redirect_to trainer_path(id: @pokemon.trainer_id)
		else
		  redirect_to new_pokemon_path
		  flash[:error] = @pokemon.errors.full_messages.to_sentence
		end
	end

end