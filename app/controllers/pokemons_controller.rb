class PokemonsController < ApplicationController
  def capture
    pkid = params[:id]
    pk = Pokemon.find_by(id: pkid)
    pk.trainer = current_trainer()
    pk.save()
    redirect_to "/"
  end
end
