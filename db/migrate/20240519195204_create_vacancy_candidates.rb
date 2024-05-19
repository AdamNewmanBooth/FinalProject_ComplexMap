class CreateVacancyCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancy_candidates do |t|
      t.integer :candidate_id
      t.integer :vacancy_id
      t.integer :party_id
      t.integer :suburban_vote
      t.integer :chicago_vote
      t.string :total_vote
      t.float :suburban_percentage
      t.float :chicago_percentage
      t.float :total_percentage

      t.timestamps
    end
  end
end
