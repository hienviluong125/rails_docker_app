class PagesController < ApplicationController
  def home
    render json: { success: true, message: "Hello Rails Docker App" }
  end
end
