class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.integer :head_commit_id, null: false
      t.index   :head_commit_id

      t.string  :name, null: false
      t.timestamps
    end
  end
end
