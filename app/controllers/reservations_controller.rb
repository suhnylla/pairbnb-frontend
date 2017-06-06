class ReservationsController < ApplicationController
  before_action :set_listing, only: [:new, :create]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    # @reservation = Reservation.find(params[:id])
    @amount = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
  end

  # GET /reservations/new
  def new
    @reservation = @listing.reservations
    @reservation = Reservation.new(listing_id: @listing.id)
    # @reservation.amount = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    # @reservation = Reservation.new(reservation_params)

    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = params[:listing_id]
    @reservation.amount = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
    # @host = "abc@gmail.com"
    
    if @reservation.check_if_overlap?
      flash.now[:danger] = "Dates overlapped!"
      render :new
    else
      respond_to do |format|
        if @reservation.save
          # ReservationMailer.notification_email(current_user.email, @host, @reservation.listing.id, @reservation.id).deliver_now
          # ReservationMailer to send a notification email after save
          # ReservationMailer.notification_email(current_user.email, @host, @reservation.listing.id, @reservation.id).deliver_later
          # ReservationJob.perform_later(current_user.email, @host, @reservation.listing.id, @reservation.id)
          # call out reservation job to perform the mail sending task after @reservation is successfully saved
          format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
          format.json { render :show, status: :created, location: @reservation }
        else
          format.html { render :new }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    end 
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    # @reservation = Reservation.find(params[:id])
    respond_to do |format|

      if @reservation.update(reservation_params)
        @reservation.amount = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
        @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def amount
    @reservation = Reservation.find(params[:id])
    @amount = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
    #@total_amount = @stay.to_i * @listing.price.to_i
  end

  private
    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:listing_id, :user_id, :start_date, :end_date, :amount)
    end
end
