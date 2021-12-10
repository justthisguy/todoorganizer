class CreateWunderlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wunderlists do |t|
      t.belongs_to :wunderfolder, null: false, foreign_key: true

      t.string :original_id
      t.string :title
      t.string :tasks, array: true, default: []
      t.string :directory_path
      t.string :text_file_path
      t.string :html_file_path

      t.timestamps
    end
  end
end
