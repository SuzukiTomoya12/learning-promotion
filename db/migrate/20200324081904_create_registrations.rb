class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|

      t.integer :level
      t.integer :exp
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
