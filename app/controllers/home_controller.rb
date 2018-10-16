class HomeController < ApplicationController

def index 
    
  end


def menu
	@sections = Section.all

    if params[:section_id].present?
      @current_section = Section.find(params[:section_id])
    end

    if @current_section.present?
      @all_food_items = @current_section.food_items.all
    else
      @all_food_items = FoodItem.all
    end

    if params[:sort_column].present?
      if params[:sort_column] == 'Name'
        if params[:sort_direction] == 'ascending'
          @all_food_items = FoodItem.order(:name)
        else
          @all_food_items = FoodItem.order(name: :desc)
        end
      else
        if params[:sort_direction] == 'ascending'
          @all_food_items = FoodItem.order(:price)
        else
          @all_food_items = FoodItem.order(price: :desc)
        end
      end
    end

    if params[:search].present?
      @all_food_items = @all_food_items.search(params[:search])
    end
  end
     
  def contact_us
  end

end
