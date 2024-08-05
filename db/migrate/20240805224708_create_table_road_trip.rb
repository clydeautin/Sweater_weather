class CreateTableRoadTrip < ActiveRecord::Migration[7.1]
  def change
    create_table :road_trips do |t|
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end
