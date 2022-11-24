class CreateZenkitlists < ActiveRecord::Migration[6.1]
  def change
    create_table :zenkitlists do |t|
      t.belongs_to :zenkitfolder, null: false, foreign_key: true

      t.string   :title

      t.timestamps
    end
  end
end
