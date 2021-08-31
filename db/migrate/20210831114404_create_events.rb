class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :capacity
      t.string :description
      t.string :category
      t.integer :recurrence_times
      t.string :recurrence_frequency
      t.string :address
      t.float :lat
      t.float :long
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
