class AddGroupIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :group, index: true, foreign_key: true
  end
end
