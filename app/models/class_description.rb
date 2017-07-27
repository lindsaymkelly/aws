# == Schema Information
#
# Table name: class_descriptions
#
#  id             :integer          not null, primary key
#  classification :string           not null
#  title          :string           not null
#  description    :text             not null
#  fees           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ClassDescription < ApplicationRecord
  validates_presence_of :classification, :title, :description, :fees
  
end
