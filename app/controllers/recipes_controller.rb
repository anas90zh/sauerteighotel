class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    def index
        @recipe = Recipe.all
    end


    def show
        find_recipe

    end


    def new
        @recipe = Recipe.new

    end


    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            flash[:notice] = "Successfully created new recipe"
            redirect_to recipe_path(@recipe)
        else 
            render 'new'
        end
    end


    def update
        @recipe = find_recipe
            if @recipe.update(recipe_params)
                flash[:sucess] = " you have sucessfully updeated"
            redirect_to recipe_path(@recipe)
            
        else 
            render 'edit'
        end 

    end

    def edit
        find_recipe

    end

    def destroy
        @recipe = find_recipe.destroy        
         flash[:sucess] = "recipe is deleted"
           redirect_to recipes_path
        
    end


    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :image) 
    end
    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

end
