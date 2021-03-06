class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  $formsURLS = { "Dental" => "dental.pdf", 
                "Drug Abuse" => "drugAbuse.pdf", 
                "Eating Disorder" => "eatingDisorder.pdf",
                "VA Benefits" => "vABenefits.pdf"}
  
  $awsBase = "https://s3.amazonaws.com/hermesapp/"
  
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
    @form = Form.new(form_params)
    respond_to do |format|
        format.html{
          
          if @form.save

             @form.update_attribute(:location_url, "/"+$formsURLS[@form.template_name])
            redirect_to @form, notice: 'Form was successfully created.'
          else
            render action: 'new'
          end
        }
        format.json{
          
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
       @form.update_attribute(:location_url, $awsBase+User.find(@form.user_id).name+"-"+$formsURLS[@form.template_name])
        respond_to do |format|
          format.html{
              redirect_to @form, notice: 'Form was successfully updated.'
          }
          format.json{

            render json: 1
          }
        end
      else
        respond_to do |format|
          format.html{
            render action: 'edit'
          }
          format.json{
            render json: 0
          }
        end
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
      params.require(:form).permit(:template_name, :user_id, :due_date)
    end
end
