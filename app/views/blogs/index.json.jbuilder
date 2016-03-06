json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :content, :lugref
  json.url blog_url(blog, format: :json)
end
