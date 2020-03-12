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
FactoryBot.define do
  factory :event do
    name { "MyString" }
    date { "2020-03-11 21:16:30" }
    private { false }
    event_type { 1 }
  end
end
