class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|

      t.string :tagname, null: false
      t.index :tagname, unique: true
      t.references :parent_tag, null: false
      t.timestamps
    end
  end
end
