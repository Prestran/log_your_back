# frozen_string_literal: true

class BacklogsController < ApplicationController
  before_action :find_backlog, only: %i[update destroy]

  def index
    @backlogs = Backlog.all
  end

  def create
    backlog = Backlog.create!(backlog_params)
    if backlog
      redirect_to backlog_path(backlog), notice: I18n.t('backlog.notice.created')
    else
      render :create
    end
  end

  def update
    if @backlog.update(backlog_params)
      redirect_to backlog_path(@backlog), notice: I18n.t('backlog.notice.updated')
    else
      render :update
    end
  end

  def destroy
    if @backlog.destroy
      redirect_to backlogs_path, notice: I18n.t('backlog.notice.deleted')
    else
      render json: @backlog.errors
    end
  end

  private

  def backlog_params
    params.permit(:id, :name, :backlog_type, :due_at)
  end

  def find_backlog
    @backlog = Backlog.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: 'not_found', status: :not_found
  end
end
