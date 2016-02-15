class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :original_url
    end
  end
end
