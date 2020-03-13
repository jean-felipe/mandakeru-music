class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_date, :event_type, :name, :event_private

  def event_date
    object.date&.strftime("%d/%m/%Y %H:%M")
  end
end
