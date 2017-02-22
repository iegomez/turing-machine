class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.string :in_char
      t.string :out_char
      t.string :direction
      t.references :machine, index: true

      t.timestamps
    end
  end
end
