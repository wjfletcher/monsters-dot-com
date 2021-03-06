class MonsterMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name, null: false
      t.string :source, null: false
      t.string :img, null: false
      t.text :description
      t.string :email
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
