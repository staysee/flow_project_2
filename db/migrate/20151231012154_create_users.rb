class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :handle
      t.string :email
      t.string :password_digest
      t.string :profile_image_url

      t.timestamps null: false
    end
  end
end
