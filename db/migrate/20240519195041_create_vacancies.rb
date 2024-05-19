class CreateVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancies do |t|
      t.integer :election_subcircuit_id
      t.integer :vacating_candidate_id
      t.string :name
      t.integer :suburban_vote
      t.integer :chicago_vote
      t.integer :total_vote
      t.integer :winning_candidate_id
      t.integer :losing_candidate_id

      t.timestamps
    end
  end
end
