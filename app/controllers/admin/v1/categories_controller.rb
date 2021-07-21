module Admin::V1
    class CategoriesController < ApiController
        def index
            @categories = Category.all
        end

        def create
            @category = Category.new
            @category.attributes = category_params

            save_category!
        rescue 
            render_error(fields: @category.errors.messages)
        end

        def update 
            @category = Category.find(params[:id])
            @category.attributes = category_params            
            save_category!
        rescue 
            render_error(fields: @category.errors.messages )
        end

        private 

        def category_params
            return {} unless params.has_key?(:category)
            params.require(:category).permit(:name)
        end

        def save_category!
            @category.save!
            render :show
        end
    end
end
