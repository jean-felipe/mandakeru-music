# == Schema Information
#
# Table name: line_ups
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#
# Indexes
#
#  index_line_ups_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class LineUp < ApplicationRecord
  belongs_to :event

  has_and_belongs_to_many :artists
end
