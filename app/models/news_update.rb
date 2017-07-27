class NewsUpdate < ApplicationRecord
  validates_presence_of :title, :description, :active?
  has_attatched_file :image, styles: {}, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :active, -> { where(active?: true) }
end
