class CreateSubcircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :subcircuits do |t|
      t.string :number

      t.timestamps
    end
  end
end
