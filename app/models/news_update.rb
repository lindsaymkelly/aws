# == Schema Information
#
# Table name: news_updates
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  description        :text             not null
#  date               :date
#  active             :boolean          default(TRUE), not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class NewsUpdate < ApplicationRecord
  validates_presence_of :title, :description
  has_attached_file :image, styles: { medium: "170x90>", thumb: "100x100>"} #, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :active_news, -> { where(active: true) }
end
