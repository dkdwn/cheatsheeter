class LandingController < ApplicationController
  allow_unauthenticated_access only: :index

  def index
  end
end
