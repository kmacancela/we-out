class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :calender_id
      t.integer :location_id
      t.integer :category_id
      t.string :title

      t.timestamps
    end
  end
end
