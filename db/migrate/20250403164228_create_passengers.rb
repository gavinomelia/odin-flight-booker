class CreatePassengers < ActiveRecord::Migration[8.0]
  def change
    create_table :passengers do |t|
      t.string :email
      t.string :name

      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
