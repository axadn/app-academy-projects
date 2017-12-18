json.extract! pokemon, :id, :name, :attack,
  :defense, :moves, :poke_type
json.image_url asset_path(pokemon.image_url)
