# == Schema Information
#
# Table name: reservations
#
#  id           :bigint           not null, primary key
#  date_from    :date
#  date_to      :date
#  user_id      :bigint           not null
#  apartment_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_approved  :boolean          default(FALSE)
#
require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
