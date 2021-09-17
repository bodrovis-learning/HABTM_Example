class PatientsController < ApplicationController
  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    if @patient.update(patient_params)
      redirect_to edit_patient_path(@patient)
    else
      render :edit
    end
  end

  private
  
  def patient_params
    params.require(:patient).permit(:name, physician_ids: [])
  end
end