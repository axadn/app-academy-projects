json.pokemon do
  json.partial! "api/pokemon/pokemon", pokemon: @pokemon
end

json.items(@pokemon.items) do |item|
  json.extract! item, :id, :name, :pokemon_id, :price, :happiness
  json.image_url asset_path(item.image_url)
end
