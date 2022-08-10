class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.where(reserved: true)
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
