class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, default: 1
      t.belongs_to :user, index: true
      t.belongs_to :library, index: true
      t.text :comment

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :libraries
  end
end
