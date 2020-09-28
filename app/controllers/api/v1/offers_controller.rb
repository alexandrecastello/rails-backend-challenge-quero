class Api::V1::OffersController < Api::V1::BaseController
  def index
    if params[:query].present?
      sql_query = "courses.kind @@ :query \
        OR courses.name @@ :query \
        OR courses.level @@ :query \
        OR courses.shift @@ :query \
        OR universities.name @@ :query\
        OR campus.city @@ :query\
        "
      @offers = Offer.joins(course: %i[:university campus]).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
    @offers.order!(price_with_discount: params[:order].to_sym) if params[:order].present?
  end
end
