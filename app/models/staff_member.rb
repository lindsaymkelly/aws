class StaffMember < ApplicationRecord
  validates_presence_of :name, :bio, :active?
  has_attatched_file :image, styles: {}, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :active, -> { where(active?: true) }
end
