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
class Artist < ApplicationRecord
  GENRES = %w(male female)

  enum genre: GENRES

  has_and_belongs_to_many :line_ups
end
