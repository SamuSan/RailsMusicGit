class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false, default: "Untitled"
      t.integer :tempo, null: false, default: 120
      t.timestamps
    end
  end
end
