class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :update, :destroy]

  # GET /chefs
  def index
    @chefs = Chef.all

    render json: @chefs
  end

  # GET /chefs/1
  def show
    render json: @chef
  end

  # POST /chefs
  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      render json: @chef, status: :created, location: @chef
    else
      render json: @chef.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chefs/1
  def update
    if @chef.update(chef_params)
      render json: @chef
    else
      render json: @chef.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chefs/1
  def destroy
    @chef.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef
      @chef = Chef.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chef_params
      params.require(:chef).permit(:name)
    end
end
