#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: "sqlite3", database: "my_db_29.db"}

class Person < ActiveRecord::Base 
  self.table_name = 'persons'
end

class Teacher < ActiveRecord::Base 
end

get '/' do
  @teachers = Teacher.order('created_at DESC')
  erb :index
end

get '/appointment' do 
  erb :appointment
end

post '/appointment' do 
  @user_name = params[:user_name]
  @user_phone = params[:user_phone]
  @date_time = params[:date_time]
  @select_teacher = params[:select_teacher]
  @color_jquery = params[:color_jquery]

  # validate_error = {
  #   user_name: "Введите имя", 
  #   user_phone: "Введите номер телефона", 
  #   date_time: "Введите время записи", 
  #   select_teacher: "Выберите учителя", 
  #   color_jquery: "Выберите цвет"
  # }

  # validate_error.each do |key, value|
  #   if params[key] == ''
  #     @error = validate_error[key]
  #     return erb :appointment
  #   end
  # end

  per = Person.new
  per.person_name = @user_name
  per.person_phone = @user_phone
  per.date_time = @date_time
  per.teacher = @select_teacher
  per.color = @color_jquery
  per.save

  erb "Your create print. Persona_draw_school: #{@user_name}, Phone: #{@user_phone}, Data_visit: #{@date_time}, Select teacher: #{@select_teacher}, Color: #{@color_jquery}"
  # erb :appointment
end