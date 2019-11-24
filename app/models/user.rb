class User < ApplicationRecord
<<<<<<< HEAD
    attr_accessor :remember_token, :activation_token
    before_save   :downcase_email
    before_create :create_activation_digest
=======
  has_many :microposts, dependent: :destroy
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
>>>>>>> advanced-login
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
<<<<<<< HEAD
<<<<<<< HEAD
  
=======
>>>>>>> updating-users3
=======

    
>>>>>>> advanced-login

    # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

# トークンがダイジェストと一致したらtrueを返す
def authenticated?(attribute, token)
  digest = send("#{attribute}_digest")
  return false if digest.nil?
  BCrypt::Password.new(digest).is_password?(token)
end
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
   # トークンがダイジェストと一致したらtrueを返す
   def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  
    
   # ユーザーのログイン情報を破棄する
   def forget
    update_attribute(:remember_digest, nil)
  end

<<<<<<< HEAD
  # アカウントを有効にする
  def activate
    update_columns(activated: FILL_IN, activated_at: FILL_IN)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
=======
    # 試作feedの定義
  # 完全な実装は次章の「ユーザーをフォローする」を参照
  def feed
    Micropost.where("user_id = ?", id)
  end

>>>>>>> advanced-login

  private

  # メールアドレスをすべて小文字にする
  def downcase_email
    self.email = email.downcase
  end

  # 有効化トークンとダイジェストを作成および代入する
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
<<<<<<< HEAD
=======

>>>>>>> advanced-login
end
