#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: "sqlite3", database: "my_db_29.db"}

class Person < ActiveRecord::Base 
  self.table_name = 'persons'
  validates :person_name, presence: true, length: {minimum: 3}
  validates :person_phone, presence: true
  validates :date_time, presence: true
  validates :teacher, presence: true
  validates :color, presence: true
end

class Teacher < ActiveRecord::Base 
end

get '/' do
  @teachers = Teacher.order('created_at DESC')
  erb :index
end

get '/appointment' do
  @per = Person.new
  erb :appointment
end

post '/appointment' do 
  # @user_name = params[:user_name]
  # @user_phone = params[:user_phone]
  # @date_time = params[:date_time]
  # @select_teacher = params[:select_teacher]
  # @color_jquery = params[:color_jquery]

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

  @per = Person.new params[:person]
  if @per.save
    erb "Запись прошла успешно. Valid: #{@per.valid?}"
  else 
    # erb "Что то пошло не так, запись не прошла."
    @error = @per.errors.full_messages.first
    erb :appointment
  end

  # erb "Спасибо, запись прошла успешно."
  # erb "#{per.valid?}"
  # erb :appointment
end

get '/teacher/:id' do 
  @teacher = Teacher.find(params[:id])
  erb :teacher
end

get '/pupils' do 
  @per_s = Person.order('created_at DESC')
  erb :pupils
end

get '/pupil/:id' do 
  @per = Person.find(params[:id])
  erb :pupil
end