require 'rails_helper'

RSpec.describe 'Courses Show Page' do
  before :each do
    @course1 = Course.create(name: "Business", time: "11:15 AM")
    @student1 = Student.create(name: "Sally Jones", email: "sally@email.com")
  end

  it "can see the courses info and a button to register" do
    visit "/courses/#{@course1.id}"

    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course1.time)
    expect(page).to have_button('Register')
  end

  it "can register for that course with an email" do
    visit "/courses/#{@course1.id}"

    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course1.time)
    expect(page).to have_button('Register')

    fill_in(:email, with: @student1.email)

    click_on 'Register'

    expect(current_path).to eq("/students/#{@student1.id}")
    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course1.time)
  end
end
