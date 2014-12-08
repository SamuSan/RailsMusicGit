class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.integer :project_id, null: false
      t.index :project_id

      t.integer :parent_commit_id
      t.index :parent_commit_id

      t.integer :commit_number, null: false
      t.timestamps
    end
  end
end
