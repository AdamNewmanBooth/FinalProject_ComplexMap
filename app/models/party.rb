# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Party < ApplicationRecord
  has_many  :vacancy_candidates, class_name: "VacancyCandidate", foreign_key: "party_id", dependent: :destroy
  has_many :candidates, through: :vacancy_candidates, source: :candidate
  validates :name, presence: true
  validates :name, uniqueness: true
end
