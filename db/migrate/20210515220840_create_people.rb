class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
