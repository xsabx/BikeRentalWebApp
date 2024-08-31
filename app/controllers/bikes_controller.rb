class BikesController < ApplicationController
  before_action :authenticate_user!, only: [:rent, :reserve]

  def index
    @start_date = params[:start_date].presence || Date.today.to_s
    @end_date = params[:end_date].presence || Date.today.to_s
    @search = params[:search]
  
    if params[:start_date].blank? || params[:end_date].blank?
      flash[:alert] = "Both start and end dates must be selected."
      return redirect_to bikes_path
    end
  
    start_date = Date.parse(@start_date)
    end_date = Date.parse(@end_date)
  
    if end_date < Date.today
      flash[:alert] = "End date cannot be in the past."
      return redirect_to bikes_path
    elsif end_date < start_date
      flash[:alert] = "End date cannot be before start date."
      return redirect_to bikes_path
    end
  
    @bikes = Bike.where.not(id: Bike.joins(:rentals)
                                    .where("rentals.start_date <= ? AND rentals.end_date >= ?", end_date, start_date))

    if @search.present?
      @bikes = @bikes.where("name LIKE ? OR bike_type LIKE ? OR frame_size LIKE ?", 
                          "%#{@search}%", "%#{@search}%", "%#{@search}%")
    end
  end
  

  def rent
    @bike = Bike.find(params[:id])
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
      @rental = current_user.rentals.new(
        bike: @bike, 
        start_date: start_date, 
        end_date: end_date
      )
      
      if @rental.save
        redirect_to rentals_path, notice: "You have successfully reserved the bike."
      else
        redirect_to rent_bike_path(@bike), alert: @rental.errors.full_messages.to_sentence
      end
    end
  end
end
