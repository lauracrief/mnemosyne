class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update]

  def index
    @schools = policy_scope(School)
  end

  # respond_to do |format|
  #   format.html
  #   format.json { render json: }
  # end

  # def build_geojson(schools, geojson)
  #   schools.each do |school|
  #     geojson << GeojsonBuilder.build_school(school)
  #   end
  # end

  def show
    # @school_coordinates = { lat: @school.latitude, lng: @school.longitude }
  end

  def edit
  end

  def update
    @school.update(school_params)

    # lorsque l'on arrive à cette méthode, vérifier si l'authorize fonctionne bien si l'user = admin
    if @school.save
      redirect_to school_path(@school)
    else
      render :edit
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
    authorize(@school)
  end

  def school_params
    params.require(:school).permit(:name, :acronym, :address_1, :address_2, :zipcode, :city, :country, :website, :phone_number)
  end
end
