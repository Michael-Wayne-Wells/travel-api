class LocationTable < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.column :city, :string
      t.column :country, :string
    end
  end
end
