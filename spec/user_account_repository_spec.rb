require 'user_account_repository'

RSpec.describe UserAccountRepository do

  def reset_user_accounts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

    before(:each) do 
      reset_user_accounts_table
    end

    it "returns a list of user accounts" do
      repo = UserAccountRepository.new

      user_accounts = repo.all
      expect(user_accounts.length).to eq(4)
      expect(user_accounts.first.id).to eq('1')
      expect(user_accounts.first.email_address).to eq('mike@mike')
    end

    it "returns a single user account" do
      repo = UserAccountRepository.new

      user_account = repo.find(1)
      expect(user_account.email_address).to eq('mike@mike') 
      expect(user_account.username).to eq('mike')
    end

    it "creates a user account" do
      repo = UserAccountRepository.new

      new_user_account = UserAccount.new
      new_user_account.email_address = 'danny@danny'
      new_user_account.username = 'danny'

      repo.create(new_user_account)

      user_accounts = repo.all
      last_user_account = user_accounts.last

      expect(last_user_account.email_address).to eq('danny@danny')

    end

    it "deletes a user account" do
      repo = UserAccountRepository.new

      id_to_delete = 1

      repo.delete(id_to_delete)

      all_user_accounts = repo.all
      expect(all_user_accounts.length).to eq(3)
      expect(all_user_accounts.first.id).to eq('2')
    end
end