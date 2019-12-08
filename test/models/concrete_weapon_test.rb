# == Schema Information
#
# Table name: concrete_weapons
#
#  id           :integer          not null, primary key
#  count        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer
#  weapon_id    :integer
#
# Indexes
#
#  index_concrete_weapons_on_character_id  (character_id)
#  index_concrete_weapons_on_weapon_id     (weapon_id)
#

require 'test_helper'

class ConcreteWeaponTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
