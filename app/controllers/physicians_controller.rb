class PhysiciansController < ApplicationController
  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new physician_params
    if @physician.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @physicians = Physician.all
  end

  def show
    @physician = Physician.find params[:id]
  end

  def destroy
    @physician = Physician.find params[:id]
    @physician.destroy
    redirect_to physicians_path
  end

  private

  def physician_params
    params.require(:physician).permit(:name, patient_ids: [])
  end
end