# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  genre      :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe '#associations' do
    it { should have_and_belong_to_many(:line_ups)}
  end

  describe '#enum' do
    it { should define_enum_for(:genre) }
  end
end
