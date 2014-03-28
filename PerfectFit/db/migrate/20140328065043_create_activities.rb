class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.datetime :date
      t.string :activity_type
      t.integer :duration
      t.integer :calories
      t.integer :distance
      t.integer :steps
      t.integer :floors
      t.integer :laps
      t.string :mood
      t.text :notes

      t.timestamps
    end
  end
end
