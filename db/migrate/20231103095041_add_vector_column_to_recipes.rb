class AddVectorColumnToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :embedding, :vector,
      limit: LangchainrbRails
        .config
        .vectorsearch
        .llm
        .default_dimension
  end
end
