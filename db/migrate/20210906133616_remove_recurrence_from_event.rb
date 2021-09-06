class RemoveRecurrenceFromEvent < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :recurrence_times
    remove_column :events, :recurrence_frequency
  end
end
