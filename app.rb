require 'sinatra/base'

require_relative './lib/email_generator'
require_relative './lib/unique_email_list'

class EmailDupesApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/emails/generate' do
    @list_size = params[:list_size].to_i
    @duplication_rate = params[:duplication_rate].to_f

    raise ArgumentError.new("list_size must be between 10 and 100,000")  if @list_size < 10 || @list_size > 100_000

    start_timer = Time.now.to_f

    raw_emails = EmailGenerator.generate(@list_size, @duplication_rate)

    generated_timer = Time.now.to_f

    list = UniqueEmailList.new

    raw_emails.each do |email|
      list.add email
    end

    filtered_emails = list.emails

    end_timer = Time.now.to_f

    @generation_time = generated_timer - start_timer
    @filtering_time = end_timer - generated_timer
    @raw_sample = raw_emails.take(100)
    @filtered_sample = filtered_emails.take(100)
    @filtered_size = filtered_emails.length

    erb :'emails/generate'
  end

end
