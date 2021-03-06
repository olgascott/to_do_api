# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :to_dos
end
