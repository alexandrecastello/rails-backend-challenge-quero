class University < ApplicationRecord
  has_many :offers
  has_many :courses
end
