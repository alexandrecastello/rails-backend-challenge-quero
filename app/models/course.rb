class Course < ApplicationRecord
  belongs_to :university
  belongs_to :campus
end
