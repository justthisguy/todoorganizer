class CreateWundertasks < ActiveRecord::Migration[6.1]
  def change
    create_table :wundertasks do |t|
      t.belongs_to :wunderlist, null: false, foreign_key: true

      t.integer  :original_id
      t.string   :title
      t.boolean  :completed
      t.boolean  :starred
      t.jsonb    :notes, default: []
      t.datetime :createdAt
      t.datetime :completedAt

      t.timestamps
    end
  end
end
