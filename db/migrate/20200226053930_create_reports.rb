class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|

      t.text :content
      t.text :image
      t.integer :total_time_hour, null: false
      t.integer :total_time_minute, null: false
      t.integer :concentration_time_hour, null: false
      t.integer :concentration_time_minute, null: false
      t.float :total_time
      t.float :concentration_time
      t.float :concentration_rate
      t.references :user_id
      t.references :tag_id
      t.timestamps
    end
  end
end