class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.float :full_price
      t.float :price_with_discount
      t.float :discount_percentage
      t.string :start_date
      t.string :enrollment_semester
      t.boolean :enabled
      t.references :course, null: false, foreign_key: true
      t.references :university, null: false, foreign_key: true
      t.references :campus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
