require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'model methods' do
    before do
      @hospital = Hospital.create!(name: 'Denver General')
      @doctor1 = @hospital.doctors.create!(name: 'Doctor 1', university: 'Uni 1', specialty: 'Emergency Medicine')
      @doctor2 = @hospital.doctors.create!(name: 'Doctor 2', university: 'Uni 2', specialty: 'Internal Medicine')
      @doctor3 = @hospital.doctors.create!(name: 'Doctor 3', university: 'Uni 2', specialty: 'Orthopedic Surgery')
    end

    describe '#unique_universities' do
      it 'returns the unique universities of all the hospitals doctors' do
        expect(@hospital.unique_universities).to eq(['Uni 1', 'Uni 2'])
      end
    end

    describe '#doctor_count' do
      it 'counts the number of doctors at the hospital' do
        expect(@hospital.doctor_count).to eq(3)
      end
    end
  end
end
