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
class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_date, :event_type, :name, :event_private

  def event_date
    object.date&.strftime("%d/%m/%Y %H:%M")
  end
end
