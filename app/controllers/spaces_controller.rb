class SpacesController < ApplicationController
  before_action :set_space, only: [:update, :show, :destroy, :edit]

  def index
    if params[:search].present?
      @spaces = Space.perform_search(params[:search])
    else
      @spaces = Space.all
    end
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(params_space)
    @space.user = current_user
    if @space.save
      redirect_to spaces_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @space.update(params_space)
    redirect_to space_path
  end

  def show
    @booking = @space.bookings.new
  end

  def destroy
    @space.destroy
    redirect_to spaces_path
  end


  private

  def params_space
    params.require(:space).permit(:address, :price, :name)
  end

  def set_space
    @space = Space.find(params[:id])
  end
end
