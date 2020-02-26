class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|

      t.string tagname, null: false
      t.integer :total_time_hour, null: false
      t.integer :total_time_minute, null: false
      t.integer :concentration_time_hour, null: false
      t.integer :concentration_time_minute, null: false
      t.text :content
      t.text :image
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
