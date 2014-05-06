class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
    t.integer :template_id
    t.integer :user_id
    t.datetime :due_date
    t.string :location_url

    t.timestamps
    end
    add_index :forms, [:user_id, :created_at]
  end
end
