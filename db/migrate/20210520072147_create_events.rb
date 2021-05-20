class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :details
      t.integer :day
      t.integer :month
      t.integer :year
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
