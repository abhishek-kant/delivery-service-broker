class CreateDeliveryOffices < ActiveRecord::Migration[5.1]
  def change
    enable_extension "postgis"
    create_table :delivery_offices do |t|
      t.string :name
      t.string :postcode
      t.st_point :lonlat, geographic: true
      t.index :lonlat, using: :gist
      t.timestamps
    end
  end
end
