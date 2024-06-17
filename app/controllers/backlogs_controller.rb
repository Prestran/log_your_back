# frozen_string_literal: true

class BacklogsController < ApplicationController
  def index
    render json: Backlog.all
  end

  def create
    backlog = Backlog.create!(backlog_params)
    if backlog
      render json: backlog
    else
      render json: backlog.errors
    end
  end

  private
  def backlog_params
    params.permit(:name, :type, :content, :due_at)
  end
end
