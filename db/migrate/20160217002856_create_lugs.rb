class CreateLugs < ActiveRecord::Migration
  def change
    create_table :lugs do |t|
      t.string :title
      t.string :post

      t.timestamps null: false
    end
  end
end
