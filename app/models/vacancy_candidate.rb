# == Schema Information
#
# Table name: vacancy_candidates
#
#  id                  :integer          not null, primary key
#  chicago_percentage  :float
#  chicago_vote        :integer
#  suburban_percentage :float
#  suburban_vote       :integer
#  total_percentage    :float
#  total_vote          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  candidate_id        :integer
#  party_id            :integer
#  vacancy_id          :integer
#
class VacancyCandidate < ApplicationRecord
  belongs_to :candidate, required: true, class_name: "Candidate", foreign_key: "candidate_id"
  belongs_to :party, required: true, class_name: "Party", foreign_key: "party_id"
  belongs_to :vacancy, required: true, class_name: "Vacancy", foreign_key: "vacancy_id"
  validates :vacancy_id, presence: true
  validates :party_id, presence: true
  validates :candidate_id, presence: true
end
