class ReservationsController < ApplicationController

  before_action :set_reservation, only: [:update]

  def index
    if params[:query].present?
      sql_query = <<~SQL
        users.first_name ILIKE :query
        OR users.last_name ILIKE :query
        OR users.email ILIKE :query
        SQL
      @reservations = Reservation.joins(:user).where(sql_query, query: "%#{params[:query]}%").and(Reservation.all.where(reserved: true))
    else
      @reservations = Reservation.all.where(reserved: true)
    end
  end

  def my_reservations
    @open_reservations = Reservation.all.where(reserved: true).and(Reservation.all.where(user: current_user))
    @closed_reservations = Reservation.all.where(reserved: false).and(Reservation.all.where(user: current_user))
  end

  def new
    @book = Book.find(params[:book_id])
    @user = current_user
    @reservation = Reservation.new
  end

  def create
    @book = Book.find(params[:book_id])
    @user = current_user
    @reservation = Reservation.new
    @reservation.book = @book
    @reservation.user = @user
    @reservation.reserved = true
    if @reservation.save
      @book.stock -= 1
      @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation.reserved = false
    @reservation.book.stock += 1
    @reservation.book.save
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end

  end

  def show
  end

  def destroy
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
