class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string   :title
      t.string   :notes
      t.string   :timeframe # Things 3 calls this 'when'
      t.datetime :deadline
      t.string   :tags ####<<<<<<<< this should be a many-to-many relationship
      t.string   :checklist_items
      t.string   :list_id
      t.string   :list
      t.string   :heading
      t.boolean  :completed
      t.boolean  :canceled
      t.datetime :creation_date
      t.string   :completion_date
      t.string   :datetime

      t.timestamps
    end
  end
end
