class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.integer :concern_id, null: false
      t.string :slug, null: false
      t.string :name, null: false
      t.text :description
      t.string :contributor_name
      t.string :contributor_place
      t.string :action_url, null: false
      t.boolean :approved, null: false, default: false
      t.integer :click_count, null: false, default: 0

      t.timestamps
    end
  end
end
