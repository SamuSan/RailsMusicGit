class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.integer :project_id, null: false
      t.index :project_id
      t.belongs_to :project
      t.timestamps
    end
  end
end
