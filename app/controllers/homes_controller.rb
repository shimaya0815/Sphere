class HomesController < ApplicationController
  # ユーザー認証をスキップするアクションを指定
  skip_before_action :authenticate_user!, only: [:top, :about]

  def top
  end

  def about
  end
end
