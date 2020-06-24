class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :car_model, foreign_key: true
      t.decimal :requested_price
      t.decimal :suggested_price
      t.string :comment
      t.string :owner_name
      t.string :owner_phone

      t.timestamps
    end
  end
end
