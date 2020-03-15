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
require 'rails_helper'

RSpec.describe LineUp, type: :model do
  describe '#associations' do
    it { should belong_to(:event) }
    it { should have_and_belong_to_many(:artists) }
  end
end
