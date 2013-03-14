collection @articles
attributes :title, :article_type, :id
# child(:user) { attributes :full_name }
# node(:read) { |post| post.read_by?(@user) }
child(:tags) do
  attributes :name
end
child(:user) do
  attributes :email
end
