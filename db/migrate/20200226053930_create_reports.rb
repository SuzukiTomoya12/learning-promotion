class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|

      t.string tagname
      t.integer :total_time_hour
      t.integer :total_time_minute
      t.integer :concentration_time_hour
      t.integer :concentration_time_minute
      t.text :content
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end
