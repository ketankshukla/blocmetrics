class RegisteredApplicationsController < ApplicationController

  before_action :authenticate_user!, except: [ :index, :show ]


  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application

    @events = @registered_application.events(:group => 'name')
  end

  def new
    @registered_application = RegisteredApplication.new
    authorize @registered_application
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application
  end

  def create
    @registered_application = RegisteredApplication.new( registered_application_params.merge( user_id: current_user.id ) )
    authorize @registered_application

    if @registered_application.save
      redirect_to @registered_application, notice: "Application was registered successfully."
    else
      flash[:error] = "Error registering application. Please try again."
      render :new
    end
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    authorize @registered_application

    if @registered_application.update_attributes( registered_application_params )
      redirect_to @registered_application, notice: "Application updated successfully."
    else
      flash[:error] = "Error updating applcation. Please try again."
      render :edit
    end

  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    name = @registered_application.name
    authorize @registered_application

    if @registered_application.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
    else
      flash[:error] = "Error deleting application. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def registered_application_params
      params.require(:registered_application).permit(:name, :url, :user_id)
    end
end
