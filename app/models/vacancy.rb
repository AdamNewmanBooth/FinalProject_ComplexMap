# == Schema Information
#
# Table name: vacancies
#
#  id                     :integer          not null, primary key
#  chicago_vote           :integer
#  name                   :string
#  suburban_vote          :integer
#  total_vote             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  election_subcircuit_id :integer
#  losing_candidate_id    :integer
#  vacating_candidate_id  :integer
#  winning_candidate_id   :integer
#
class Vacancy < ApplicationRecord
  belongs_to :vacating_candidate, required: true, class_name: "Candidate", foreign_key: "vacating_candidate_id"
  belongs_to :winning_candidate, required: true, class_name: "Candidate", foreign_key: "winning_candidate_id"
  belongs_to :losing_candidate, required: true, class_name: "Candidate", foreign_key: "losing_candidate_id"
  has_many  :vacancy_candidates, class_name: "VacancyCandidate", foreign_key: "vacancy_id", dependent: :destroy
  belongs_to :election_subcircuit, required: true, class_name: "ElectionSubcircuit", foreign_key: "election_subcircuit_id"
  has_many :candidates, through: :vacancy_candidates, source: :candidate
  has_one  :election, through: :election_subcircuit, source: :election
  has_one  :subcircuit, through: :election_subcircuit, source: :subcircuit
  validates :election_subcircuit_id, presence: true
end
