# == Schema Information
#
# Table name: characters
#
#  id              :integer          not null, primary key
#  name            :string
#  character_class :string
#  level           :integer
#  background      :string
#  race            :string
#  alignment       :string
#  experience      :integer
#  armor_class     :integer
#  initiative      :integer
#  speed           :integer
#  max_hp          :integer
#  current_hp      :integer
#  temporary_hp    :integer
#  saves_success   :integer
#  saves_failures  :integer
#  strength        :integer
#  dexterity       :integer
#  constitution    :integer
#  intelligence    :integer
#  wisdom          :integer
#  charisma        :integer
#  inspiration     :integer
#  proficiency     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  lvl4feat        :string
#  lvl8feat        :string
#  lvl12feat       :string
#  lvl16feat       :string
#  lvl19feat       :string
#  description     :text
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

#  dexterity       :integer
#  constitution    :integer
#  intelligence    :integer
#  wisdom          :integer
#  charisma        :integer
#  inspiration     :integer
#  proficiency     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  lvl4feat        :string
#  lvl8feat        :string
#  lvl12feat       :string
#  lvl16feat       :string
#  lvl19feat       :string
#  description     :text
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

class Character < ApplicationRecord
    belongs_to :user, optional: true
    has_many :concrete_weapons, dependent: :destroy
    has_many :concrete_items, dependent: :destroy
    
    
    validate :always_true
    def always_true

    end

end


