class AddReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :grossness, null: false
      t.integer :scariness, null: false
      t.integer :cleverness, null: false
      t.integer :bigness, null: false
      t.integer :badness, null: false
      t.text :body

      t.belongs_to :user, null: false
      t.belongs_to :monster, null: false

      t.timestamps
    end
  end
end
