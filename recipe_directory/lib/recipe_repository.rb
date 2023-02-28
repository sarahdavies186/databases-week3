require_relative "./recipe"

class RecipeRepository
  def all
    recipes = []

    sql = "SELECT * FROM recipes;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |item|
      recipe = Recipe.new

      recipe.id = item["id"]
      recipe.name = item["name"]
      recipe.cooking_time = item["cooking_time"]
      recipe.rating = item["rating"]

      recipes << recipe
    end
    return recipes
  end

  def find(id)
    sql = "SELECT name, cooking_time, rating FROM recipes WHERE id = $1"
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    item = result[0]

    recipe = Recipe.new
    recipe.id = item["id"]
    recipe.name = item["name"]
    recipe.cooking_time = item["cooking_time"]
    recipe.rating = item["rating"]

    return recipe
  end
end
