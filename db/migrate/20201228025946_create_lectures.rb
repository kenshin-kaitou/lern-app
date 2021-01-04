class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :title , null: false
      t.text   :overview
      t.references :user, null: false , foreign_key: true
      t.timestamps
    end
  end
end
