class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health - 10
		if @pokemon.health < 1
			redirect_to destroy_path
		end
		redirect_to trainer_path
	end

	def destroy
		@pokemon = Pokemon.find(params[:id])
		@pokemon.destroy
		flash[:success] = 'Destroyed'
		redirect_to trainer_path
	end
	def new
		render 'new'
	end

	def create
		@pokemon = Pokemon.new
		@pokemon.level = 1
		@pokemon.health = 100
		@pokemon.trainer = current_trainer
		if @pokemon.save
			redirect_to trainer_path
		else
			render 'new'
		end
		redirect_to trainer_path
	end


end
