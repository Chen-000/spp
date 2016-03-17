# -*- encoding : utf-8 -*-

class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|	  
    	t.text :item, :comment => '项目'
    	t.text :content, :comment => '内容'
    	t.timestamps
    end
  end
end

