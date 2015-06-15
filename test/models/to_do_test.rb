# == Schema Information
#
# Table name: to_dos
#
#  id         :integer          not null, primary key
#  title      :string
#  checked    :boolean          default(FALSE)
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ToDoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
