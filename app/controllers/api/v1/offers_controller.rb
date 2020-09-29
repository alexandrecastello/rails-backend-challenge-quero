class Api::V1::OffersController < Api::V1::BaseController
  def index
    @offers = Offer.joins(course: %i[university campus])
    @offers = @offers.where("courses.name @@ :query", query: "%#{params[:course_name]}%") if params[:course_name]
    @offers = @offers.where("courses.level @@ :query", query: "%#{params[:course_level]}%") if params[:course_level]
    @offers = @offers.where("courses.kind @@ :query", query: "%#{params[:course_kind]}%") if params[:course_kind]
    @offers = @offers.where("courses.shift @@ :query", query: "%#{params[:course_shift]}%") if params[:course_shift]
    @offers = @offers.where("universities.name @@ :query", query: "%#{params[:university_name]}%") if params[:university_name]
    @offers = @offers.where("campus.city @@ :query", query: "%#{params[:campus_city]}%") if params[:campus_city]
    @offers.order!(price_with_discount: params[:order].to_sym) if params[:order]
  end
end
