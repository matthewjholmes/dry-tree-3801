require 'rails_helper'

RSpec.describe 'hospital show page' do
  before do
    @hospital = Hospital.create!(name: 'Denver General')
    @doctor1 = @hospital.doctors.create!(name: 'Doctor 1', university: 'Uni 1', specialty: 'Emergency Medicine')
    @doctor2 = @hospital.doctors.create!(name: 'Doctor 2', university: 'Uni 2', specialty: 'Internal Medicine')
    @doctor3 = @hospital.doctors.create!(name: 'Doctor 3', university: 'Uni 2', specialty: 'Orthopedic Surgery')

    visit hospital_path(@hospital)
  end

  it 'i visit the hospital show page' do
    expect(current_path).to eq(hospital_path(@hospital))
  end

  it 'i see the hospital name, number of doctors and list of unique universities' do
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content('3 doctors')
    expect(page).to have_content('Uni 1')
    expect(page).to have_content('Uni 2', count: 1)
  end
end
