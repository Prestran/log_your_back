# frozen_string_literal: true

class BacklogsController < ApplicationController
  before_action :find_backlog, only: %i[show edit update destroy]

  def index
    @backlogs = Backlog.ordered
  end

  def show; end

  def new
    @backlog = Backlog.new
  end

  def edit; end

  def create
    @backlog = Backlog.new(backlog_params)

    respond_to do |format|
      if @backlog.save
        format.html { redirect_to backlogs_path, notice: I18n.t('backlog.notice.created') }
        format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    if @backlog.update(backlog_params)
      redirect_to backlogs_path, notice: I18n.t('backlog.notice.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    respond_to do |format|
      if @backlog.destroy
        format.html { redirect_to backlogs_path, notice: I18n.t('backlog.notice.deleted') }
        format.turbo_stream
      else
        format.json @backlog.errors
      end
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
