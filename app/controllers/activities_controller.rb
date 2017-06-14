class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  # GET /attachments
  # GET /attachments.json
  def index
    @activities = Activity.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    keyword = params[:keyword].to_s.downcase
    @children = @activity.children
    unless keyword.blank?
      @children = @children.where("Lower(first_name) LIKE ? OR Lower(last_name) LIKE ?", "%#{keyword}%", "%#{keyword}%")
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end


end
