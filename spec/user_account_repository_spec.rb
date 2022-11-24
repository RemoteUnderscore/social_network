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





end