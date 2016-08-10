class AddSourceLinkToInfo < ActiveRecord::Migration
  def change
    add_column :infos, :source_link, :string
  end
end
