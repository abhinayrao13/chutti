class LeavesController < ApplicationController
  def index
    @leave = Leave.all
  end
  def new
    @leave = Leave.new
  end
  def create
    @leave = Leave.create()
  end
  def show

  end
  def edit

  end
  def update

  end
  def delete

  end
end
