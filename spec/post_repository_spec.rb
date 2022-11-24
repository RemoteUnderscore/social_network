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
  end
