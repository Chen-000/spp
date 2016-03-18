class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
    	t.string :name
    	t.text :content
    	t.timestamps
    end
  end
end
