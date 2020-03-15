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
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#associations' do
    it { should have_one(:line_up) }
    it { should have_one(:address) }
    it { should have_many(:artists).through(:line_up) }
    it { should have_and_belong_to_many(:genres) }
  end

  describe '#validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:name) }
  end

  describe '#enum' do
    it { should define_enum_for(:event_type) }
  end
end
