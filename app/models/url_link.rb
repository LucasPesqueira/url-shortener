class UrlLink < ApplicationRecord
  before_validation :generate_shortened_url

  belongs_to :user

  validates :original_url, :shortened_url, presence: true

  private

  def generate_shortened_url
    self.shortened_url = "#{ENV['ROOT_URL']}#{rand(36**8).to_s(36)}"
  end
end
