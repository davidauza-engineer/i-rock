class AchievementsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :owners_only, only: [ :edit, :update, :destroy ]

  def index
    @achievements = Achievement.public_access
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      UserMailer.achievement_created(current_user.email, @achievement.id).deliver_now
      redirect_to achievement_url(@achievement), notice: 'Achievement has been created'
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    if @achievement.update(achievement_params)
      redirect_to achievement_url
    else
      render :edit
    end
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  def destroy
    @achievement.destroy
    redirect_to achievements_url
  end

  private

  def achievement_params
    params.require(:achievement).permit(:title, :description, :privacy, :cover_image, :featured, :user_id)
  end

  def owners_only
    @achievement = Achievement.find(params[:id])
    if current_user != @achievement.user
      redirect_to achievements_path
    end
  end
end