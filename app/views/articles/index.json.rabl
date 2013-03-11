collection @articles
attributes :title, :content, :article_type
# child(:user) { attributes :full_name }
# node(:read) { |post| post.read_by?(@user) }
child(:tags) do
  attributes :name
end
