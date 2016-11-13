class IndexIdeaSlug < ActiveRecord::Migration[5.0]
  def change
    add_index :ideas, :slug
  end
end
