class Recipe < ApplicationRecord
  vectorsearch

  after_save :upsert_to_vectorsearch

  # Turbo Streams
  after_destroy_commit -> { broadcast_remove_to 'recipes' }

end
