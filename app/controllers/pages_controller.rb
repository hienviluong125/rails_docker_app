class PagesController < ApplicationController
  def home
    render json: { success: true, message: "Hello Rails Docker App Trigger In Master Branch" }
  end
end
