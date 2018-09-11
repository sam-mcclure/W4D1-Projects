class ArtworksController < ApplicationController 
  def index 
    artworks_made = Artwork.where(artist_id: params[:user_id])
    artwork_shares = ArtworkShare.where(viewer_id: params[:user_id]).map {|share| share.artwork}
    all_artworks = artworks_made + artwork_shares
    
    render json: all_artworks
  end
  
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end
  
  def update 
    artwork = Artwork.find(params[:id])
    
    if artwork.update(artwork_params)
      render json: artwork 
    else 
        render json: artwork.errors.full_messages, status: 422
    end
  end
  
  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  private 
  
  def artwork_params 
    params.require(:artwork).permit(:title,:image_url,:artist_id)
  end
  
  
end