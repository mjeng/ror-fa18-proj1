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
end
