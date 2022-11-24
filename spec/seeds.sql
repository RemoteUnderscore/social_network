TRUNCATE TABLE user_accounts, posts RESTART IDENTITY; 

INSERT INTO user_accounts (email_address, username) VALUES ('mike@mike', 'mike');
INSERT INTO user_accounts (email_address, username) VALUES ('orla@orla', 'orla');
INSERT INTO user_accounts (email_address, username) VALUES ('jim@jim', 'jim');
INSERT INTO user_accounts (email_address, username) VALUES ('alexis@alexis', 'alexis');
INSERT INTO posts (post_title, post_content, post_views, user_account_id) VALUES ('day one', 'Once upon a time...', '3', '1');
INSERT INTO posts (post_title, post_content, post_views, user_account_id) VALUES ('one', 'Today was a good day...', '6', '2');
INSERT INTO posts (post_title, post_content, post_views, user_account_id) VALUES ('part one', 'It was a dark and stormy night...', '200', '3');
INSERT INTO posts (post_title, post_content, post_views, user_account_id) VALUES ('intro', 'The quick brown fox...', '40', '4');
