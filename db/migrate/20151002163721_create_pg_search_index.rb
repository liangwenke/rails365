class CreatePgSearchIndex < ActiveRecord::Migration
  def up
    execute("CREATE INDEX articles_idx ON articles USING gin(to_tsvector('testzhcfg', title || ' ' || body));")
    execute("CREATE INDEX tags_idx ON tags USING gin(to_tsvector('testzhcfg', name));")
  end

  def down
    execute("DROP INDEX articles_idx;")
    execute("DROP INDEX tags_idx;")
  end
end
