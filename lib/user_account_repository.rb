class UserAccountRepository
  def all
    sql = 'SELECT id, email_address, username FROM user_accounts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    user_accounts = []

    result_set.each do |record|
      user_account = UserAccount.new
      user_account.id = record['id']
      user_account.email_address = record['email_address']
      user_account_username = record['username']

      user_accounts << user_account
    end
      return user_accounts
    end





end