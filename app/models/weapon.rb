# == Schema Information
#
# Table name: weapons
#
#  id         :integer          not null, primary key
#  name       :string
#  cost       :integer
#  weight     :integer
#  properties :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Weapon < ApplicationRecord
end
