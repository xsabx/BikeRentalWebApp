class BikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    if @start_date.present? && @end_date.present?
      # Parse dates to ensure they are in the correct format
      start_date = Date.parse(@start_date)
      end_date = Date.parse(@end_date)

      # Find bikes that are not rented during the selected period
      @bikes = Bike.left_joins(:rentals)
                   .where.not(id: Bike.joins(:rentals)
                   .where("rentals.start_date <= ? AND rentals.end_date >= ?", end_date, start_date))
                   .distinct
    else
      # Show bikes that are available at the current moment
      @bikes = Bike.left_joins(:rentals)
                   .where("rentals.id IS NULL OR rentals.end_date < ?", Date.today)
                   .distinct
    end
  end

  def rent
    @bike = Bike.find(params[:id])
    if !@bike.available?
      redirect_to bikes_path, alert: "This bike is not available."
    end
  end

  def reserve
    @bike = Bike.find(params[:id])
    start_date = params[:start_date]
    end_date = params[:end_date]

    if start_date.blank? || end_date.blank?
      redirect_to rent_bike_path(@bike), alert: "Please select both start and end dates."
    elsif start_date.to_date > end_date.to_date
      redirect_to rent_bike_path(@bike), alert: "End date cannot be before start date."
    else
      @rental = current_user.rentals.create(
        bike: @bike, 
        start_date: start_date, 
        end_date: end_date
      )
      redirect_to rentals_path, notice: "You have successfully reserved the bike."
    end
  end
end
