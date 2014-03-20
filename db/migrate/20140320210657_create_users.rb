class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :realName
      t.date :dob
      t.integer :userKey
      t.string :email
      t.date :lastlogin
      t.date :signedup
      t.string :usertype

      t.timestamps
    end
  end
end
