# frozen_string_literal: true

class BacklogsController < ApplicationController
  before_action :find_backlog, only: %i[update destroy]

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

  def destroy
    if @backlog.destroy
      render json: :ok
    else
      render json: @backlog.errors
    end
  end

  def update
    if @backlog.update(backlog_params)
      render json: @backlog
    else
      render json: @backlog.errors
    end
  end

  private

  def backlog_params
    params.permit(:id, :name, :type, :content, :due_at)
  end

  def find_backlog
    @backlog = Backlog.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: 'not_found', status: :not_found
  end
end
