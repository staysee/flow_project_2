class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :user_id

      t.timestamps null: false
    end
  end
end
