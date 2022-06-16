# == Schema Information
#
# Table name: apartments
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Apartment < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservation
end
