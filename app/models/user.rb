class User < ActiveRecord::Base
	attr_accessor :remember_token, :reset_token
	before_save :downcase_email

	has_many :comments, dependent: :destroy

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :name,  presence: true, length: { maximum: 50 }
	validates :password , presence: true, length: {minimum: 6}, allow_nil: true
	validates :email, presence: true, length: { maximum: 150 }, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	has_secure_password
	has_friendship
	ratyrate_rater


	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
				BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def create_reset_digest
		self.reset_token = User.new_token
		update_columns(reset_digest:  User.digest(reset_token),
									 reset_sent_at: Time.zone.now)
	end

	def send_password_reset_email
		UserMailer.password_reset(self).deliver_now
	end

	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end

	def has_requested_friend(user)
		self.requested_friends.exists?(user)
	end

	private

    def downcase_email
      self.email = email.downcase
    end
end
