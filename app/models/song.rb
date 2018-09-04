class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :release_year, presence: true, :if => "self.released==true"#if: :released?
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, :if => "self.released==true"#if: :released?
end
