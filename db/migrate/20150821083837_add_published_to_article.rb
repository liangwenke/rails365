class AddPublishedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean, default: false
  end
end
