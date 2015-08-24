class AddCounterCacheToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :articles_count, :integer, default: 0
  end
end
