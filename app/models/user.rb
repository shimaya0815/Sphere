class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todos

  before_create :set_office_id

  private

  def set_office_id
    self.office_id = SecureRandom.hex(10) # 10文字のランダムな16進数の文字列を生成
  end
end
