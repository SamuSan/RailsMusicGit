class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.integer :project_id


      t.index :project_id

      t.string :branch_name, null: false
      t.timestamps
    end
  end
end
