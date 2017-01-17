class MonsterMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :monster do |t|
      t.string :name, null: false
      t.string :source, null: false
      t.string :img, null: false
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end
