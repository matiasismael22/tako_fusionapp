class CreateDteDirections < ActiveRecord::Migration[5.0]
  def change
    create_table :dte_directions do |t|
      t.string :direction
      t.references :user, foreign_key: true
      t.references :direction, foreign_key: true

      t.timestamps
    end
  end
end
