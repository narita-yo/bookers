class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :profile_image_id
      t.text :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
