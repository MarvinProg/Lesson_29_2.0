#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :datebase, "sqlite3:my_db.db"

class Person < ActiveRecord::Base 

end

get '/' do
  erb "Hello! "
end