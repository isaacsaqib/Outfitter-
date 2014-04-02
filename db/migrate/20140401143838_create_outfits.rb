class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :description
      t.string :brand_name
      t.string :style
      t.integer :user_id
      t.integer :vote_count, default: 0
      t.timestamps
    end
  end
end


