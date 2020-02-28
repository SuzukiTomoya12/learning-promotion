class CreateParentTags < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_tags do |t|

      t.string :parent_tagname, null: false
      t.text :description
      t.timestamps
    end
  end
end
