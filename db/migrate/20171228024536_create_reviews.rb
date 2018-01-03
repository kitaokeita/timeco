class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :impression
      t.references :user, foreign_key: true
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
