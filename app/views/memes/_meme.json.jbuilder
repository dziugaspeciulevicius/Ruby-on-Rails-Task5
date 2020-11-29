json.extract! meme, :id, :meme_url, :created_at, :updated_at
json.url meme_url(meme, format: :json)
