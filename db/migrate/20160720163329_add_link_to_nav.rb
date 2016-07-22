class AddLinkToNav < ActiveRecord::Migration
  def change
    add_column :navs, :link, :string
  end
end
