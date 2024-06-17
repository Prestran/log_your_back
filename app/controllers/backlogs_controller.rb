# frozen_string_literal: true

class BacklogsController < ApplicationController
  def index
    render json: Backlog.all
  end
end
