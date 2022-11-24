class CreateZenkitsubtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :zenkitsubtasks do |t|
      t.belongs_to :zenkittask, null: false, foreign_key: true

      t.string  :title
      t.boolean :done

      t.timestamps
    end
  end
end
