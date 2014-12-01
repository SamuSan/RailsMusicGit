class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :position, null: false
      t.integer :duration, null: false, default: 4
      t.float :frequency, null: false, default: 261.6



      t.integer :commit_id, null: false
      t.index :commit_id
      t.belongs_to :commit
      t.timestamps
    end
  end
end
