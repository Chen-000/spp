class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :catalog_id
      t.text :desc
      t.string :uploadfiles
      t.timestamps
    end
  end
end
