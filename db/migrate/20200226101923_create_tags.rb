class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|

      t.string :name
      t.index :name
      t.string :ancestry
      
      t.timestamps
    end
  end
end
