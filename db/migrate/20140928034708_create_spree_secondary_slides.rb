class CreateSpreeSecondarySlides < ActiveRecord::Migration
  def change
    create_table :spree_secondary_slides do |t|
      t.string :name
      t.text :body
      t.string :thumbnail_message
      t.string :target_url
      t.boolean :published
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :position

      t.timestamps
    end
  end
end
