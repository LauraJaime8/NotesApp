class CollectionsController < ApplicationController

  def new
    @collection = Collection.new(collection_params)
  end



  private

    def collection_params
      params.require(:collection).permit(:title, :notes)
    end
end
