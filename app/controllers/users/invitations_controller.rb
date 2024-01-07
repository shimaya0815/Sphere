class Users::InvitationsController < Devise::InvitationsController
  before_action :authenticate_user!, except: [:create]
  before_action :validate_office_id, except: [:create]

  # 以下のアクションは Devise のデフォルトの動作に従います
  # new, create, update

  private

  # 現在のユーザーの office_id が params の office_id と一致することを検証
  def validate_office_id
    if user_signed_in? && current_user.office_id.to_s != params[:office_id]
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
