class RegistrationController < ApplicationController
  def create
    course = Course.find_by(id: registration_params[:course_id])
    student = Student.find_by(email: registration_params[:email])
    registration = CourseRegistration.new(course_id: course.id, student_id: student.id)
    if registration.save
      redirect_to "/students/#{student.id}"
    end
  end

  def destroy
    entry = CourseRegistration.find_by(course_id: unregister_params[:course_id], student_id: unregister_params[:student_id])
    entry.destroy
    redirect_to "/students/#{unregister_params[:student_id]}"
  end


  private
  def registration_params
    params.permit(:course_id, :email)
  end

  def unregister_params
    params.permit(:course_id, :student_id)
  end
end
