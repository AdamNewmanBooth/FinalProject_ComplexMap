# == Schema Information
#
# Table name: candidates
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Candidate < ApplicationRecord
  has_many  :vacancy_candidates, class_name: "VacancyCandidate", foreign_key: "candidate_id", dependent: :destroy
  has_many  :vacancies_as_vacator, class_name: "Vacancy", foreign_key: "vacating_candidate_id", dependent: :destroy
  has_many  :vacancies_as_winner, class_name: "Vacancy", foreign_key: "winning_candidate_id", dependent: :destroy
  has_many  :vacancies_as_loser, class_name: "Vacancy", foreign_key: "losing_candidate_id", dependent: :destroy
  has_many :parties, through: :vacancy_candidates, source: :party
  has_many :vacancies, through: :vacancy_candidates, source: :vacancy
  validates :last_name, presence: true
  validates :first_name, presence: true
end
