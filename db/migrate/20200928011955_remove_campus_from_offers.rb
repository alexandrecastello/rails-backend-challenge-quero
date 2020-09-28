class RemoveCampusFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :offers, :campus, null: false, foreign_key: true
  end
end
