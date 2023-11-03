class Recipe < ApplicationRecord
  vectorsearch

  after_save :upsert_to_vectorsearch

end
