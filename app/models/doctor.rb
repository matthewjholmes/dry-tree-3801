class Doctor < ApplicationRecord
  
  validates_presence_of :name, :specialty, :university

  belongs_to :hospital
  has_many :patient_rosters, dependent: :destroy
  has_many :patients, through: :patient_rosters
end
