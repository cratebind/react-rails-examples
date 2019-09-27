# == Schema Information
#
# Table name: locations
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  latitude    :float
#  longitude   :float
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ApplicationRecord
  has_one_attached :image
end
