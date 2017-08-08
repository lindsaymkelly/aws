# == Schema Information
#
# Table name: scheduled_classes
#
#  id         :integer          not null, primary key
#  start_date :date             not null
#  end_date   :date             not null
#  time       :time             not null
#  name       :string           not null
#  about      :text             not null
#  instructor :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScheduledClass < ApplicationRecord
  validates_presence_of :start_date, :end_date, :time, :name, :about, :instructor

  scope :by_instructor, -> (teacher) { where instructor: teacher }
  scope :by_name, -> (klass) { where name: klass }
  scope :active_classes, lambda{ |date = Date.current| where("? BETWEEN start_date AND end_date", date)}

  def self.options_for_instructors
    uniq.pluck(:instructor) << 'All Instructors'
  end

  def self.options_for_classes
    uniq.pluck(:name) << 'All Classes'
  end

  def self.days_of_week
    {"Monday"=>1, "Tuesday"=>2, "Wednesday"=>3, "Thursday"=>4, "Friday"=>5, "Saturday"=>6, "Sunday"=>7}
  end

  def day
    self.start_date.strftime("%A")
  end
  
end
