class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :formkey
      t.datetime :dateshared
      t.datetime :duedate
      t.string :source

      t.timestamps
    end
  end
end
