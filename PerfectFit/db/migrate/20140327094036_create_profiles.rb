class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.integer :weight
      t.integer :zipcode
      t.date :birthday
      t.integer :user_id

      t.timestamps
    end
  end
end
