class PatientRostersController < ApplicationController

  def destroy
    roster_patient = PatientRoster.find(params[:id])
    roster_patient.destroy
    redirect_to doctor_path(roster_patient.doctor_id)
  end
end
