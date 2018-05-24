class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
    @notes = Note.search(params[:search])
  end

  def show
  end

  def collections
    collection = Collection.find_by(name: params[:name])
    @notes = collection.notes
  end

  def new
    if !session[:user]
      redirect_to notes_path, :alert => "You must be logged"
    else
      @note = Note.new
    end
  end


  def edit
    @note = Note.find(params[:id])
    if @note.user.name != session[:user]
      redirect_to notes_path, :alert => "You can't edit a note that is not yours :("
    else
      @note = Note.find(params[:id])
    end
  end

  def create
    @note = Note.new(note_params)
    @note.user = User.find_by name: session[:user]
    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to notes_path, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @note.user.name != session[:user]
      redirect_to notes_path, :alert =>"You can't delete a note that is not yours :("
    else
      @note.destroy
      respond_to do |format|
        format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :body, :user_id, :cover)
    end
end
