class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  after_create { |admin| admin.send_reset_password_instructions }

  def self.ransackable_attributes(auth_object = nil)
    %w(email current_sign_in_at sign_in_count created_at)
  end

  def password_required?
    new_record? ? false : super
  end
end
