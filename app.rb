#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: "sqlite3", database: "my_db.db"}

class Person < ActiveRecord::Base 
end

class Teacher < ActiveRecord::Base 
end

get '/' do
  erb :index
end