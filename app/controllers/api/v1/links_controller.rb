class Api::V1::LinksController < Api::V1::ApiController
  respond_to :json

  def update
    respond_with current_user.links.update(params[:id], link_params)
  end

  private

  def link_params
    params.require(:link).permit(:read)
  end
end
