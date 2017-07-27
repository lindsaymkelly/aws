# == Schema Information
#
# Table name: staff_members
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  bio                :text             not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  active?            :boolean          default(TRUE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class StaffMember < ApplicationRecord
  validates_presence_of :name, :bio, :active?
  has_attatched_file :image, styles: {}, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :active, -> { where(active?: true) }
end
