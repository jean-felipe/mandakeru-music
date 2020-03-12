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
end
