class PagesController < ApplicationController
  def home
    render json: { success: true, message: "Hello Rails Docker App v1.0.1" }
  end
end
