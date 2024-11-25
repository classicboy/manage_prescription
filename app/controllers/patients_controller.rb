class PatientsController < ApplicationController
  before_action :prepare_patient, only: [:show]

  def index
    @patients = current_doctor.patients
  end

  def show; end

  def new
    @patient = current_doctor.patients.new
  end

  def create
    @patient = current_doctor.patients.new(patient_params)

    if @patient.save
      redirect_to patient_path(@patient), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def prepare_patient
    @patient = current_doctor.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :phone, :dob)
  end
end
