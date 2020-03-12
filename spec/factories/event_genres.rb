# == Schema Information
#
# Table name: event_genres
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#  genre_id   :bigint           not null
#
# Indexes
#
#  index_event_genres_on_event_id               (event_id)
#  index_event_genres_on_event_id_and_genre_id  (event_id,genre_id)
#  index_event_genres_on_genre_id               (genre_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (genre_id => genres.id)
#
FactoryBot.define do
  factory :event_genre do
    event { nil }
    genre { nil }
  end
end
