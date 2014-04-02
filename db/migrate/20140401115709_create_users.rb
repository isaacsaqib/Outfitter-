class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.integer :age
      t.string :style
      t.string :password_digest
      t.timestamps
    end
  end
end
