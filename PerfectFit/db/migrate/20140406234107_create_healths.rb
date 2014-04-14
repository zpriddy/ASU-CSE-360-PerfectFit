class CreateHealths < ActiveRecord::Migration
  def change
    create_table :healths do |t|
      t.integer :user_id
      t.string :log_type
      t.integer :weight
      t.string :food
      t.integer :calories
      t.integer :BPM
      t.string :BP
      t.string :BMI
      t.datetime :date
      t.time :sleep
      t.string :cholesterol

      t.timestamps
    end
  end
end
