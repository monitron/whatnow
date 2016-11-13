class CreateConcerns < ActiveRecord::Migration[5.0]
  def change
    create_table :concerns do |t|
      t.string :name, null: false
    end
  end
end
