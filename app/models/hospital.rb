class Hospital < ApplicationRecord

  validates_presence_of :name

  has_many :doctors

  def unique_universities
    doctors.distinct.pluck(:university)
  end

  def doctor_count
    doctors.count
  end
end
