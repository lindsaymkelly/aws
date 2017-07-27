# == Schema Information
#
# Table name: results
#
#  id                 :integer          not null, primary key
#  year               :date             not null
#  level              :string           not null
#  description        :text             not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Result < ApplicationRecord
  validates_presence_of :year, :level, :description
end
