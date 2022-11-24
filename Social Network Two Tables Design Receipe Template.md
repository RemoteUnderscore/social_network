# Two Tables Design Recipe Template

Copy this recipe template to design and create two related database tables from a specification.

1. Extract nouns from the user stories or specification

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.

Nouns:

user account, email address, username, posts, post title, post content, post views

2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

```sql

| Record         |     	Properties                      |
--------------------------------------------------------|
| user account   | email address, username     |
| post  	       | post title, post content, post views |


```

Name of the first table (always plural): user_accounts

Column names: email_address, username

Name of the second table (always plural): posts

Column names: post_title, post_content, post_views

3. Decide the column types.

Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: user_accounts
id: SERIAL
email_address: text
username: text


Table: posts
id: SERIAL
post_title: text
post_content: text
post_views: int


4. Decide on The Tables Relationship

Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)
You'll then be able to say that:

[A] has many [B]
And on the other side, [B] belongs to [A]
In that case, the foreign key is in the table [B]
Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one user account have many posts? YES
2. Can one post have many user accounts? NO

-> Therefore,
-> An artist HAS MANY albums
-> An album BELONGS TO an artist

A post belongs to a user account

-> Therefore, the foreign key is on the albums table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

4. Write the SQL.

-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.

```sql
CREATE TABLE user_accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  post_title text,
  post_content text,
  post_views int,
  user_account_id int,
  constraint fk_user_account foreign key(user_account_id)
    references user_accounts(id)
    on delete cascade
);

```
5. Create the tables.

psql -h 127.0.0.1 database_name < albums_table.sql