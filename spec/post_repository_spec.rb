require 'post_repository'

RSpec.describe PostRepository do

  def reset_posts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

    before(:each) do 
      reset_posts_table
     end
    
    it "returns a list of posts" do
      repo = PostRepository.new

      posts = repo.all
      expect(posts.first.id).to eq('1')
      expect(posts.length).to eq(4)
      expect(posts.first.post_title).to eq('day one')
    end

    it "returns a single post" do
      repo = PostRepository.new

      post = repo.find(1)
      expect(post.post_title).to eq('day one')
      expect(post.post_content).to eq('Once upon a time...')
    end

    it "creates a new post" do
    repo = PostRepository.new

    new_post = Post.new
    new_post.post_title = 'day two'
    new_post.post_content = 'In a land far, far away...'
    new_post.post_views = '1'
    new_post.user_account_id = 1

    repo.create(new_post)

    all_posts = repo.all
    
      expect(all_posts).to include(
        have_attributes(
          post_title: new_post.post_title,
          post_content: new_post.post_content,
          post_views: '1',
          user_account_id: '1'
        )
      )
  end

  end
