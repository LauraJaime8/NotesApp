class NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  def show
    @notes = Note.find(params[:id])
  end
end