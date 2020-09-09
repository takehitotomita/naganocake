class TopController < ApplicationController
	before_action :authenticate_session!
  def top
  end
end
