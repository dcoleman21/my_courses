class Student < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :course_registrations
  has_many :courses, through: :course_registrations
end
