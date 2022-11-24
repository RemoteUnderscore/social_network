require_relative 'user_account'

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

  def find(id)
    sql = 'SELECT id, email_address, username FROM user_accounts WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    user_account = UserAccount.new
    user_account.id = record['id']
    user_account.email_address = record['email_address']
    user_account.username = record['username']

    return user_account


    end



end