class Api::V1::CoursesController < Api::V1::BaseController
  def index
    @courses = Course.joins(:university)
    # @courses = @courses.where("courses.name @@ :query", query: "%#{params[:course_name]}%") if params[:course_name]
    @courses = @courses.where("courses.level @@ :query", query: "%#{params[:course_level]}%") if params[:course_level]
    @courses = @courses.where("courses.kind @@ :query", query: "%#{params[:course_kind]}%") if params[:course_kind]
    @courses = @courses.where("courses.shift @@ :query", query: "%#{params[:course_shift]}%") if params[:course_shift]
    @courses = @courses.where("universities.name @@ :query", query: "%#{params[:university_name]}%") if params[:university_name]
  end
end