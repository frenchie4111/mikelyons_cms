class AddIndexToPageAliasesName < ActiveRecord::Migration
  def change
    add_index :page_aliases, :name, unique: true
  end
end
