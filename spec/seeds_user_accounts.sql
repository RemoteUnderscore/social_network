TRUNCATE TABLE user_accounts RESTART IDENTITY; 

INSERT INTO user_accounts (email_address, username) VALUES ('mike@mike', 'mike');
INSERT INTO user_accounts (email_address, username) VALUES ('orla@orla', 'orla');
INSERT INTO user_accounts (email_address, username) VALUES ('jim@jim', 'jim');
INSERT INTO user_accounts (email_address, username) VALUES ('alexis@alexis', 'alexis');