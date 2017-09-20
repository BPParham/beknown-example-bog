# This migration comes from beknown (originally 20150831131759)
class CreateBeknownEntries < ActiveRecord::Migration
  def change
    create_table :beknown_entries do |t|
      t.string :type, index: true
      t.string :title
      t.string :slug, index: true
      t.json :payload
      t.boolean :draft, default: false
      t.integer :user_id, index: true
      t.string :author_name
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
