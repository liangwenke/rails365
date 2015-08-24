class RemoveArticleIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :article_id
  end
end
