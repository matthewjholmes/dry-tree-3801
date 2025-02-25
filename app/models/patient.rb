class Patient < ApplicationRecord

  validates_presence_of :name, :age

  has_many :patient_rosters, dependent: :destroy
  has_many :doctors, through: :patient_rosters

  def self.order_by_age_desc
    order(age: :desc)
  end
  
end
