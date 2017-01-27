class AddDefaultRemoveNullMonsterImg < ActiveRecord::Migration[5.0]
  def up
    change_column :monsters, :img, :string, null: true, default: "https://www.acefitness.org/myace/images/contactimage/no_phototn.jpg"
  end

  def down
    change_column :monsters, :img, :string, null: false
  end
end
