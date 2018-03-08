class NotesController < ApplicationController
  #GET /notes
  def index
    @notes = Note.all
  end

  #GET /notes/:id
  def show
    @note = Note.find(params[:id])
  end

  #GET /notes/new
  def new
    @note = Note.new
  end
  #POST /notes

  def create
    @note = Note.new(title: params[:note][:title],
                      content: params[:note][:content])
    @note.save
    redirect_to @note
  end
end
