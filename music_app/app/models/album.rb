# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :bigint           not null
#  live?      :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :title, :year, :band_id, :live?, presence: true
    validates :band_id, uniqueness: { scope: :title }

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band
end
