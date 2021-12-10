class CreateWundersubtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :wundersubtasks do |t|
      t.belongs_to :wundertask, null: false, foreign_key: true

      t.string     :title
      t.boolean    :completed
      t.datetime   :completedAt
      t.datetime   :createdAt

      t.timestamps
    end
  end
end