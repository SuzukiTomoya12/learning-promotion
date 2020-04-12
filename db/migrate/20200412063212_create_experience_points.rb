class CreateExperiencePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :experience_points do |t|

      t.integer :until_next_level, null: false
      t.integer :total_required_experience, null: false
      t.timestamps
    end
  end
end
