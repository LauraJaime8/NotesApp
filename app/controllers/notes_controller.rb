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
    if @note.save #Si las validaciones han pasado
      redirect_to @note
    else
      render :new
    end

  end
end
