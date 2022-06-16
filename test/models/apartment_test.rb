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
require 'test_helper'

class ApartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
