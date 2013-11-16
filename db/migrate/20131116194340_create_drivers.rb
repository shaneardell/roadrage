class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :license_plate_number

      t.timestamps
    end
  end
end
