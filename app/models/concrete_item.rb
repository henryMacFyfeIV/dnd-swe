# == Schema Information
#
# Table name: concrete_items
#
#  id           :integer          not null, primary key
#  count        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer
#  item_id      :integer
#
# Indexes
#
#  index_concrete_items_on_character_id  (character_id)
#  index_concrete_items_on_item_id       (item_id)
#

class ConcreteItem < ApplicationRecord
    belongs_to :item
    belongs_to :character
end
