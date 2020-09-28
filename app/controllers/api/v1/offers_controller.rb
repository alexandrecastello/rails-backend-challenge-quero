class Api::V1::OffersController < Api::V1::BaseController
  def index
    @offers = Offer.all
  end
end