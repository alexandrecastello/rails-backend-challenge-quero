class RemoveUniversityFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :offers, :university, null: false, foreign_key: true
  end
end
