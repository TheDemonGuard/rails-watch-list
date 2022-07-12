class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true # uniqueness: true, allow_blank: false, presence: { strict: true }
  has_many :bookmarks, dependent: :destroy
  # has_many :movies, through: bookmarks #, dependent: :destroy
  has_many :movies, through: :bookmarks # , dependent: :destroy
  has_one_attached :photo
end
