class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @student = Student.new
    @course = Course.find(params[:id])
  end
end
