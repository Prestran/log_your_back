# frozen_string_literal: true

class BacklogsController < ApplicationController
  before_action :find_backlog, only: %i[show edit update destroy]

  def index
    @backlogs = Backlog.all
  end

  def show; end

  def new
    @backlog = Backlog.new
  end

  def edit; end

  def create
    @backlog = Backlog.new(backlog_params)
    if @backlog.save
      redirect_to backlog_path(@backlog), notice: I18n.t('backlog.notice.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @backlog.update(backlog_params)
      redirect_to backlog_path(@backlog), notice: I18n.t('backlog.notice.updated')
    else
      render :edit, status: :unprocessable_entity
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
    params.require(:backlog).permit(:id, :name, :backlog_type, :due_at)
  end

  def find_backlog
    @backlog = Backlog.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: 'not_found', status: :not_found
  end
end
