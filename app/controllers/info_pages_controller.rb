class InfoPagesController < ApplicationController
  def permalink
    @page = InfoPage.find_by(permalink: params[:permalink])
  end
end
