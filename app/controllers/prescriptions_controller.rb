class PrescriptionsController < ApplicationController
  def index
    @prescriptions = current_doctor.prescriptions.includes(:patient)
  end
end
