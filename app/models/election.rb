# == Schema Information
#
# Table name: elections
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Election < ApplicationRecord
end
