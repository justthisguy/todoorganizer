class CreateZenkitfolders < ActiveRecord::Migration[6.1]
  def change
    create_table :zenkitfolders do |t|

      t.string   :title

      t.timestamps
    end
  end
end
