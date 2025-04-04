class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: params[:flight_id])
    # params[:passenger_count].to_i.times { @booking.passengers.build }
    params[:passenger_count].to_i.times { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "Booking successfully created"
      redirect_to @booking
    else
      @flight = Flight.find(@booking.flight_id)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
