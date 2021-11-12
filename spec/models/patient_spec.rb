require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should have_many(:patient_rosters) }
    it { should have_many(:doctors).through(:patient_rosters) }
  end

  describe 'model methods' do
    describe '#order_by_age_desc' do
      it 'orders patient by age oldest to youngest' do
        hospital = Hospital.create!(name: 'Denver General')
        doctor = hospital.doctors.create!(name: 'Doctor 1', university: 'Uni 1', specialty: 'Emergency Medicine')
        patient1 = doctor.patients.create!(name: 'Patient 1', age: 11)
        patient2 = doctor.patients.create!(name: 'Patient 2', age: 22)
        patient3 = doctor.patients.create!(name: 'Patient 3', age: 33)

        expect(Patient.order_by_age_desc).to eq([patient3, patient2, patient1])
      end
    end
  end
end
