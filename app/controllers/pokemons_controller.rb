class PokemonsController < ApplicationController
  def capture
    pkid = params[:id]
    pk = Pokemon.find_by(id: pkid)
    pk.trainer = current_trainer()
    pk.save()
    redirect_to "/"
  end

  def damage
    pkid = params[:id]
    pk = Pokemon.find_by(id: pkid)
    pk.health -= 10
    if pk.health <= 0
      pk.destroy()
    end
    pk.save()
    redirect_to trainer_path(current_trainer())
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.valid?
      @pokemon.health = 100
      @pokemon.level = 1
      @pokemon.trainer = current_trainer()
      @pokemon.save()
      redirect_to trainer_path(current_trainer())
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to pokemons_path()
    end
  end

  private
    def pokemon_params
      params.require(:pokemon).permit(:name, :ndex)
    end
end
