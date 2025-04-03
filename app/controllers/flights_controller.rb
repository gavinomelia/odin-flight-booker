class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @flights = Flight.all
    @airports = Airport.all

    apply_search_filters if search_params_present?

    @passenger_count = params[:passengers].to_i if params[:passengers].present?
  end



  # GET /flights/1 or /flights/1.json
  def show
    @arrival_time = @flight.start_datetime + @flight.duration.minutes
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy!

    respond_to do |format|
      format.html { redirect_to flights_path, status: :see_other, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def search_params_present?
      params[:departure_airport].present? ||
      params[:arrival_airport].present? ||
      params[:start_datetime].present?
    end

    def apply_search_filters
      filter_by_airports if params[:departure_airport].present? && params[:arrival_airport].present?
      filter_by_date if params[:start_datetime].present?
    end

    def filter_by_airports
      @flights = @flights.where(
        departure_airport_id: params[:departure_airport],
        arrival_airport_id: params[:arrival_airport]
      )
    end

    def filter_by_date
      date = Date.parse(params[:start_datetime])
      @flights = @flights.where("DATE(start_datetime) = ?", date)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.fetch(:flight, {})
    end
end
