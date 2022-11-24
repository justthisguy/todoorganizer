class CreateZenkittasks < ActiveRecord::Migration[6.1]
  def change
    create_table :zenkittasks do |t|
      t.belongs_to :zenkitlist, null: false, foreign_key: true

      t.string   :title
      t.string   :stage
      t.string   :due_date
      t.string   :notes
      t.string   :files
      t.string   :assigned_to
      t.datetime :created
      t.datetime :last_updated
      t.string   :created_by
      t.string   :last_updated_by
      t.string   :checklists
      t.string   :comments

      t.timestamps
    end
  end
end
