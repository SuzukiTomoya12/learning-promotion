class CreateReportsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :reports_tags do |t|

      t.references :report, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
