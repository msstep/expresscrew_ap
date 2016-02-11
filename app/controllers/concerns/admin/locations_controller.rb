class Admin::LocationsController < ApplicationController
  respond_to :json

  skip_before_action :verify_authenticity_token

  def index
    #sleep 2
    @locations = Location.limit 50
  end


  def create
    sleep 2
    @location = Location.new
    if @location.update_attributes params[:location]
      render :show
    else
      respond_with @location
    end
  end

  def update
    sleep 2
    @location = Location.find params[:id]
    if @location.update_attributes params[:location]
      render :show
    else
      respond_with @location
    end
  end


  def destroy
    location = Location.find params[:id]
    location.destroy
    render json: {}
  end  


  private

    def crew_params
      params.require(:location).permit(:name, :description, :danger)
    end  

end