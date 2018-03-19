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
    render :new
  end
  #POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save #Si las validaciones han pasado
      redirect_to notes_path
    else
      redirect_to notes_path #New es la vista a la que se refiere y no al metodo de este mismo controlador
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to notes_path
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path
  end


  private

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
