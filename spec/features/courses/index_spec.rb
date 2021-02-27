require 'rails_helper'

RSpec.describe 'Courses Index Page' do
  before :each do
    @student1 = Student.create(name: "Sally Jones", email: "sally@email.com")
    @student2 = Student.create(name: "Ben Harper", email: "ben@email.com")
    @student3 = Student.create(name: "Latisha Brown", email: "latisha@email.com")
    @student4 = Student.create(name: "Calvin Jenkins", email: "calvin@email.com")

    @course1 = Course.create(name: "Business", time: "11:15 AM")
    @course2 = Course.create(name: "Engineering", time: "2:20 PM")
    @course3 = Course.create(name: "Finance", time: "8:30 AM")
    @course4 = Course.create(name: "Economics", time: "4:25 PM")
  end

  it "lists all of the available courses" do
    visit '/courses'

    expect(page).to have_content('Available Courses')
    expect(page).to have_css('.course')

    within(first('.course')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.time')
    end
  end

  it "can click on course name to go to that courses show page" do
    visit '/courses'

    expect(page).to have_content('Available Courses')
    expect(page).to have_css('.course')

    within(first('.course')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.time')
    end

    click_on "#{@course1.name}"
    expect(current_path).to eq("/courses/#{@course1.id}")
  end
end
