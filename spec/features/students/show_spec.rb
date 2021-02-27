require 'rails_helper'

RSpec.describe 'Students Show Page' do
  before :each do
    @student1 = Student.create!(name: "Sally Jones", email: "sally@email.com")
    @student2 = Student.create!(name: "Ben Harper", email: "ben@email.com")
    @student3 = Student.create!(name: "Latisha Brown", email: "latisha@email.com")
    @student4 = Student.create!(name: "Calvin Jenkins", email: "calvin@email.com")

    @course1 = Course.create!(name: "Business", time: "11:15 AM")
    @course2 = Course.create!(name: "Engineering", time: "2:20 PM")
    @course3 = Course.create!(name: "Finance", time: "8:30 AM")
    @course4 = Course.create!(name: "Economics", time: "4:25 PM")

    @student1.course_registrations.create!(student_id: @student1.id, course_id: @course1.id)
    @student1.course_registrations.create!(student_id: @student1.id, course_id: @course3.id)
  end

  it "can see a list of course registrations" do
    visit "/students/#{@student1.id}"

    expect(page).to have_content("#{@student1.name}'s Courses")
    expect(page).to have_css('.course')

    within(first('.course')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.time')
      expect(page).to have_button('Cancel Registration')
    end
  end

  it "can cancel a registration" do
    visit "/students/#{@student1.id}"

    expect(page).to have_content("#{@student1.name}'s Courses")
    expect(page).to have_css('.course')

    within("#course-#{@course1.id}") do
      expect(page).to have_css('.name')
      expect(page).to have_css('.time')
      expect(page).to have_button('Cancel Registration')
      click_button 'Cancel Registration'
    end
    expect(current_path).to eq("/students/#{@student1.id}")
  end
end
