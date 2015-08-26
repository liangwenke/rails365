class AddVisitCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :visit_count, :integer, default: 0
  end
end
