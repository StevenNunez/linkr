class ShortLink < ActiveRecord::Base
  belongs_to :user
  before_create :generate_short_code

  def shortened_link
    "/#{short_code}"
  end

  private
  def generate_short_code
    self.short_code = SecureRandom.urlsafe_base64
  end
end
