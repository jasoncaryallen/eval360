module AccessKeys
  extend ActiveSupport::Concern

  def to_param
    access_key
  end

  def set_access_key
    return if access_key.present?

    loop do
      self.access_key = SecureRandom.hex(8)
      break unless self.class.exists?(access_key: access_key)
    end
  end
end
