# == Schema Information
#
# Table name: scheduled_classes
#
#  id         :integer          not null, primary key
#  day        :string           not null
#  time       :time             not null
#  active?    :boolean          default(TRUE), not null
#  name       :string           not null
#  about      :text             not null
#  instructor :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScheduledClass < ApplicationRecord
  validates_presence_of :day, :time, :active?, :name, :about, :instructor

  scope :active, -> { where(active?: true) }
end
