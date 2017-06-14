class CampsitesController < ApplicationController
  before_action :set_campsite, only: [:show]

  # GET /attachments
  # GET /attachments.json
  def index
    @campsites = Campsite.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_campsite
    @campsite = Campsite.find(params[:id])
  end


end
