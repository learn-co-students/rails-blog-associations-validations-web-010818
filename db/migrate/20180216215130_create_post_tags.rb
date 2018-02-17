class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.references :post
      t.references :tag
      t.timestamps null: false
    end
  end
end
