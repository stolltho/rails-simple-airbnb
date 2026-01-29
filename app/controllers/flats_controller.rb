class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    query = params.dig(:search, :query)
    if query.present?
      @flats = Flat.where("name LIKE ? OR address LIKE ?", "%#{query}%", "%#{query}%")
    else
      @flats = Flat.all
    end
  end

  def show
    # @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @flat = Flat.find(params[:id])
  end

  def update
    # @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
