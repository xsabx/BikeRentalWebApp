class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rentals = current_user.rentals
  end

  def destroy
    @rental = current_user.rentals.find(params[:id])
    @rental.destroy
    redirect_to rentals_path, notice: "Your reservation has been canceled."
  end
end
