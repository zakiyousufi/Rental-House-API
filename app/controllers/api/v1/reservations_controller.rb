class Api::V1::ReservationsController < ApplicationController
  # GET /reservations
  def index
    @reservations = Reservation.includes(:house).where('user_id = ?', current_user)

    render json: @reservations
  end

  # POST /houses/1/rservation
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.update(user: current_user, house: house.find(params[:house_id]))

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservation/1
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { success: true, message: 'Reservation deleted successfully' }, status: :ok
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:from_date, :to_date, :number_of_persons)
  end
end
