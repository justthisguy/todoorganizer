class CreateWunderfolders < ActiveRecord::Migration[6.1]
  def change
    create_table :wunderfolders do |t|
      t.string   :title
      t.string   :directory_path
      t.datetime :createdAt
      t.datetime :updatedAt

      t.timestamps
    end
  end
end
