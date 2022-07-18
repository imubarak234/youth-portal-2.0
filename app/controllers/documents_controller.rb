class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document_new = current_user.documents.new
    respond_to do |format|
      format.html { render :new, locals: { documents: @document_new } }
    end
  end

  def create
    document_create = Document.new(params.require(:documents).permit(:name, :group_document))
    document_create.update(user_id: current_user.id, group_id: Group.find_by(user_id: current_user.id).id)

    respond_to do |format|
      format.html do
        flash[:notice] = if document_create.save
                           'Document Added'
                         else
                           'Error: Document no added'
                         end
        redirect_to documents_path
      end
    end
  end
end
