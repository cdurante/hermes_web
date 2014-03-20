class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :appointmentKey
      t.datetime :date
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
