# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  date       :datetime         not null
#  event_type :integer          not null
#  name       :string           not null
#  private    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
  EVENT_TYPES = %w(festival concert)

  enum event_type: EVENT_TYPES

  has_one :line_up
  has_one :address
  has_and_belongs_to_many :genres

  has_many :artists, through: :line_up 

  validates :date, :event_type, :name, presence: true
  
end
