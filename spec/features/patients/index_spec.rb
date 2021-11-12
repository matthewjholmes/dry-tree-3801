require 'rails_helper'

RSpec.describe 'patients index' do
  before do
    @hospital = Hospital.create!(name: 'Denver General')
    @doctor1 = @hospital.doctors.create!(name: 'Doctor 1', university: 'Uni 1', specialty: 'Emergency Medicine')
    @patient1 = @doctor1.patients.create!(name: 'Patient 1', age: 11)
    @patient2 = @doctor1.patients.create!(name: 'Patient 2', age: 22)
    @patient3 = @doctor1.patients.create!(name: 'Patient 3', age: 33)

    visit patients_path
  end

  it 'i see names of all patients listed oldest to youngest' do
    expect(@patient3.name).to appear_before(@patient2.name)
    expect(@patient2.name).to appear_before(@patient1.name)
  end
end
