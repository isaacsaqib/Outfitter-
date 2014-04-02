class AddAttachmentsPhotoToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :photo_file_name, :string
    add_column :outfits, :photo_content_type, :string
    add_column :outfits, :photo_file_size, :integer
    add_column :outfits, :photo_updated_at, :datetime
  end
end
