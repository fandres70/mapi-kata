require "sequel"

DEFAULT_DB = Sequel.connect('postgres://localhost/postgres')

DEFAULT_DB.run("DROP DATABASE IF EXISTS microblog_api_kata")
DEFAULT_DB.run("CREATE DATABASE microblog_api_kata")

DB = Sequel.connect('postgres://localhost/microblog_api_kata')

DB.create_table :users do
  primary_key :id
  String :username, :text => true, :unique => true
  String :password, :text => true
  String :realname, :text => true
end

DB.create_table :tokens do
  String :value, :text => true
  Integer :user_id
end

DB.create_table :posts do
  primary_key :id
  String :text, :text => true
  Integer :user_id
end

DB.create_table :followings do
  Integer :follower_id
  Integer :followee_id
  primary_key [:follower_id, :followee_id]
end
