class PrescriptionsController < ApplicationController
  before_action :prepare_prescription, only: [:show, :edit, :update]
  before_action :prepare_patient, only: [:create]

  def index
    @prescriptions = current_doctor.prescriptions.includes(:patient)
  end

  def show; end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = @patient.prescriptions.new(prescription_params)

    if @prescription.save
      redirect_to prescription_path(@prescription), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @prescription.update(prescription_params)
      redirect_to prescription_path(@prescription), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def prepare_prescription
    @prescription = current_doctor.prescriptions.find(params[:id])
  end

  def prepare_patient
    @patient = current_doctor.patients.find(params[:prescription][:patient_id])
  end

  def prescription_params
    params.require(:prescription).permit(:patient_id, :detail, :date, :remark)
  end
end
