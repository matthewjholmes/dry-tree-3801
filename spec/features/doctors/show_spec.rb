require 'rails_helper'

RSpec.describe 'doctor show page' do
  describe 'when i visit a doctors show page' do
    before do
      @hospital = Hospital.create!(name: 'Denver General')
      @doctor = @hospital.doctors.create!(name: 'Doctor 1', university: 'Uni 1', specialty: 'Emergency Medicine')
      @patient1 = @doctor.patients.create!(name: 'Patient 1', age: 11)
      @patient2 = @doctor.patients.create!(name: 'Patient 2', age: 22)

      visit doctor_path(@doctor)
    end

    it 'i see doc name, specialty, and university' do
      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.specialty)
      expect(page).to have_content(@doctor.university)
    end

    it 'i see the hospital where doc works' do
      expect(page).to have_content(@doctor.hospital.name)
    end

    it 'i see all docs patients' do
      @doctor.patients.each do |patient|
        expect(page).to have_content(patient.name)
      end
    end

    it 'i see a button to remove patient from caseload' do
      @doctor.patients.each do |patient|
        within "#patient-#{patient.id}" do
          click_button 'Remove from caseload'
        end
        expect(current_path).to eq(doctor_path(@doctor))
        expect(page).to_not have_content(patient.name)
      end
    end
  end
end
