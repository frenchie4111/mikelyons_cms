class CreatePageAliases < ActiveRecord::Migration
  def change
    create_table :page_aliases do |t|
      t.string :name
      t.integer :page_id

      t.timestamps
    end
  end
end
