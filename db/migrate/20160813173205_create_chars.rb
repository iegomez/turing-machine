class CreateChars < ActiveRecord::Migration
  def change
    create_table :chars do |t|
      t.references :alphabet, index: true
      t.string :char

      t.timestamps
    end
  end
end
