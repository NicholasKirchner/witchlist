get '/' do
  erb :index
end

get '/category/:id' do
  @category_id = params[:id]
  @category_name = Category.find(@category_id).name
  erb :posts
end

get '/new' do
  erb :new_post
end

get '/post/edit' do
  @post = Post.where('key = ?', params["key"]).first
  erb :edit_post
end

post '/' do
  params['key'] = SecureRandom.hex(10)
  Post.create(params)
  erb :post_confirm
end

post '/edit' do
  @post = Post.where('key = ?', params["key"]).first
  @post.author = params['author']
  @post.email = params['email']
  @post.price = params['price'].to_i
  @post.content = params['content']
  @post.category_id = params['category_id'].to_i
  @post.save
  erb :post_confirm
end

post '/delete' do
  @id = Post.where('key = ?', params["key"]).first.id
  Post.delete(@id)
  erb :delete_confirm
end
