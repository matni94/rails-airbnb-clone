class PagesController < ApplicationController
  def home
    @spaces = Space.limit(6)
  end
end
