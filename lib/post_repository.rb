require_relative './post'

class PostRepository
  def all
    sql = 'SELECT id, post_title, post_content, post_views, user_account_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.post_title = record['post_title']
      post.post_content = record['post_content']
      post.post_views = record['post_views']
      post.user_account_id = record['user_account_id']

      posts << post
    end
      return posts
    end

  def find(id)

    sql = 'SELECT id, post_title, post_content, post_views, user_account_id FROM posts WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    post = Post.new
    post.id = record['id']
    post.post_title = record['post_title']
    post.post_content = record['post_content']
    post.post_views = record['post_views']
    post.user_account_id = record['user_account_id']

    return post
  end
end
