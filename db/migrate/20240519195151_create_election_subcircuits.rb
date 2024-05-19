class CreateElectionSubcircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :election_subcircuits do |t|
      t.integer :election_id
      t.integer :subcircuit_id

      t.timestamps
    end
  end
end
