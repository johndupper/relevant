class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :img_url

      t.timestamps
    end
  end
end
