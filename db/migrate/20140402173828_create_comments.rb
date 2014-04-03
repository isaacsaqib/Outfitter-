class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :outfit_id
      t.integer :user_id
      t.string :text_section
      t.timestamps
    end
  end
end
