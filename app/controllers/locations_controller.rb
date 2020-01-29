class LocationsController < ApplicationController

  def index
    search = params[:search]
    @locations = Location.search(search)
    json_response(@locations)
  end

  def show
    @location = Location.find(params[:id])
    json_response(@location)
  end

  def most_reviewed
    @locations = Location.most_reviewed
    json_response(@locations)
  end

  def create
    @location = Location.create!(location_params)
    json_response(@location, :created)
  end

  def update
    @location = Location.find(params[:id])
    if @location.update!(location_params)
      render status: 200, json: {
        message: "This location has been updated successfully."
      }
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def location_params
  params.permit(:city, :country)
  end
end
