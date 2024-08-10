class CategoriesController < ApplicationController
    before_action :load_category, only: [:edit, :update, :destroy]

    def index
      @categories = Category.order(:name)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to categories_path, notice: "Categoria criada com sucesso"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to categories_path, notice: "Categoria atualizada com sucesso"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path, notice: "Categoria removida com sucesso"
    end

    private

    def category_params
      params.require(:category).permit(:identifier, :name)
    end

    def load_category
        @category = Category.find(params[:id])
    end
end
