class LinksController < ApplicationController
  def create
  end

  def index
    link_data = @user.new_links_simple
    if !!link_data
      render json: {status: 'SUCCESS', message: 'Loaded up links', data: link_data}, status: :ok
    else
      render nothing: true, status: :service_unavailable
  end

  def add_to_the_pile(links,user)
    links.each do |link|
      link.piles.create(user_id: user.id)
    end
  end
end
