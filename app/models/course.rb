class Course < ApplicationRecord
  has_many :offers
  belongs_to :university
  belongs_to :campus
end
