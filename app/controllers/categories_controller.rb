class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :set_categories, only: [:index, :edit, :new]
  # before_action :set_types, only: [:index, :new, :edit]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    @category = Category.new
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    
  end

  # POST /categories or /categories.json
  def create
    sleep 1
    @category = Category.new(category_params)
    unless @category.save
      render json: @category.errors, status: :unprocessable_entity
    end
    # respond_to do |format|
    #   if @category.save
    #     format.html { redirect_to @category, notice: "Category was successfully created." }
    #     format.json { render :show, status: :created, location: @category }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # def data_categories
  #   @categories = Category.build_data
  #   render json: @categories
  # end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    @category.update(category_params)
    # respond_to do |format|
    #   if @category.update(category_params)
    #     format.html { redirect_to @category, notice: "Category was successfully updated." }
    #     format.json { render :show, status: :ok, location: @category }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def set_categories
      @categories_ids = Category.all.map{ |category| [category.name, category.id]}
    end

    # def set_types
    #   @types = Type.all.map{ |type| [type.name, type.id]}
    # end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category_id, :type_id, :name, :public)
    end
end
