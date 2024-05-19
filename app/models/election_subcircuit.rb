# == Schema Information
#
# Table name: election_subcircuits
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  election_id   :integer
#  subcircuit_id :integer
#
class ElectionSubcircuit < ApplicationRecord
end
