class Api::V1::CoursesController < Api::V1::BaseController
  def index
    if params[:query].present?
      sql_query = "courses.kind @@ :query \
        OR courses.level @@ :query \
        OR courses.shift @@ :query \
        OR universities.name @@ :query\
        "
      @courses = Course.joins(:university).where(sql_query, query: "%#{params[:query]}%")
    else
      @courses = Course.all
    end
  end
end