require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:time) }
  end

  describe "relationships" do
    it { should have_many(:course_registrations) }
    it { should have_many(:students).through(:course_registrations) }
  end
end
