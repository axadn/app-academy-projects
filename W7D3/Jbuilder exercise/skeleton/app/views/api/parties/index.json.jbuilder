json.array! @parties do |party|
  json.partial! "api/parties/party", party: party
  json.guests do
    party.guests.each do |guest|
      json.set! guest.id do
        json.partial! "api/guests/guest", guest: guest
      end
    end
  end
end
