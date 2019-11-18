class AddLinkToSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :link, :string
  end
end
