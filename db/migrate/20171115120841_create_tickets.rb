class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.datetime :nitizi
      t.integer :price
      t.references :user, foreign_key: true
      t.string :area

      t.timestamps
    end
  end
end
