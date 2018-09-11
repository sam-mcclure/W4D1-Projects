class ArtworkSharesController < ApplicationController 
  def index 
    artwork_shares = ArtworkShare.all 
    render json: artwork_shares
  end
  
  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    if artwork_share.save
      render json: artwork_share
    else 
      render json: artwork_share.errors.full_messages, status: 422
    end
  end
  
  def show
    artwork_share = ArtworkShare.find(params[:id])
    render json: artwork_share
  end
  
  def update 
    artwork_share = ArtworkShare.find(params[:id])
    
    if artwork_share.update(artwork_share_params)
      render json: artwork_share 
    else 
        render json: artwork_share.errors.full_messages, status: 422
    end
  end
  
  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    if artwork_share.destroy
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end
  
  private 
  
  def artwork_share_params 
    params.require(:artwork_share).permit(:artwork_id,:viewer_id)
  end
end