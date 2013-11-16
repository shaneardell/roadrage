class AddReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to  :driver
      t.string      :offense
      t.timestamps

      t.foreign_key :drivers
    end
  end
end

