class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.references :band, null: false, foreign_key: true
      t.boolean :live?, null: false, :default => true
      #combination of band_id and title only appears once
      t.index [:band_id, :title], unique: true
      t.timestamps
    end
    add_index :albums, :title
  end
end
