class CreateDirections < ActiveRecord::Migration[5.0]
  def change
    create_table :directions do |t|
      t.string :direction_name
      t.integer :number
      t.string :reference

      t.timestamps
    end
  end
end
