class CreateReportTags < ActiveRecord::Migration[5.0]
  def change
    create_table :report_tags do |t|

      t.timestamps
    end
  end
end
