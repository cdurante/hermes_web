class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  def index
    @forms = Form.all
  end

  # GET /forms/1
  def show
    @form = Form.find(params[:id])
    respond_to do |format|
      format.html{
        render html: @form
      }
      format.json{
        render json: @form
      }
    end
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  def create 
    respond_to do |format|
        format.html{
          @form = Form.new(form_params)
          if @form.save
            redirect_to @form, notice: 'Form was successfully created.'
          else
            render action: 'new'
          end
        }
        format.json{
          @form = Form.new(form_params)
          if @form.save
            render json: @form
          else
            render json: 'There was an error'
          end
        }
    end
  end

  # PATCH/PUT /forms/1
  def update
    if @form.update(form_params)
      redirect_to @form, notice: 'Form was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /forms/1
  def destroy
    @form.destroy
    redirect_to forms_url, notice: 'Form was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_params
      params.require(:form).permit(:template_id, :user_id, :due_date)
    end
end
