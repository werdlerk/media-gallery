class MediaController < ApplicationController

  def index
    @media = Media.all
  end
end