class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :uid,   null: false, unique: true
      t.string  :type,  null: false, unique: true
      t.string  :email, null: false, unique: true
      t.string  :token, null: false, unique: true

      t.timestamps
    end
  end
end
