class University < ApplicationRecord
  has_many :courses
  has_many :offers, through: :courses
end
