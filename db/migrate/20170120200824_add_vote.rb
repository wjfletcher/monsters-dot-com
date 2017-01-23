class AddVote < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :value

      t.belongs_to :user, null: false
      t.belongs_to :review, null: false

      t.timestamps
    end
  end
end
