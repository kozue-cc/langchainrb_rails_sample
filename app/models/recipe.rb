require 'csv'

class Recipe < ApplicationRecord
  vectorsearch

  after_save :upsert_to_vectorsearch

  # Turbo Streams
  after_destroy_commit -> { broadcast_remove_to 'recipes' }

  # Recipeをまとめて作成する
  def self.bulk_create(csv_file)
    recipes = []
    CSV.foreach(csv_file.path, headers: true) do |row|
      recipe = Recipe.new(row.to_hash)
      recipes << recipe
    end
    Recipe.import recipes
  end

  # Recipeをまとめて更新する
  def self.bulk_update(csv_file)
    recipes = []
    CSV.foreach(csv_file.path, headers: true) do |row|
      recipe = Recipe.find(row['id'])
      recipe.update(row.to_hash)
      recipes << recipe
    end
    Recipe.import recipes
  end
end
