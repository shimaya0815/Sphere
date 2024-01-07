class Todo < ApplicationRecord
  # 既存のユーザーとの関連付け
  belongs_to :user
  belongs_to :tax_client, optional: true
  # 新しい担当者との関連付け。
  # 担当者はUserモデルから選ばれ、assignee_idカラムに保存される。
  # optional: true は担当者がいなくても良いことを示している。
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: true

  # 期限のバリデーション。
  # 期限は必須であることを示している。
  validates :deadline, presence: true
end
