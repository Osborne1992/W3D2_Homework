require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?

get '/' do
  erb :index
end

get'/about_us' do
  erb :about_us
end

get '/faq' do
  erb :faq
end

get '/calculators' do
  erb :calculators
end

get '/advanced_calc' do
  erb :advanced_calc
end

get '/basic_calc' do
  erb :basic_calc
end

get '/age_calc' do
  erb :age_calc
end

get '/volume_calc' do
  erb :volume_calc
end

get '/calculate_age' do
  @dob_day = params[:dob_day].to_i
  @dob_month = params[:dob_month].to_i
  @dob_year = params[:dob_year].to_i
  date = Date.today
  @result = date.year - @dob_year
  @result = @result - 1 if (@dob_month > date.month or (@dob_month >= date.month and @dob_day > date.day))

  erb :result

end

get '/calculate' do
  @first_number = params[:first_number].to_f
  @operator = params[:operator]
  @second_number = params[:second_number].to_f
  @third_number = params[:third_number].to_f

  @result = case @operator
  when '+'
    @first_number + @second_number
  when '-'
    @first_number - @second_number
  when '*'
    @first_number * @second_number
  when '/'
    @first_number / @second_number
  when 'power'
    @first_number ** @second_number
  when 'root'
    Math.sqrt(@first_number)
  when 'cube'
    @first_number ** 3.0
  when 'sphere'
    (4.0 / 3.0) * (Math::PI) * (@first_number ** 3.0)
  when 'cylinder'
    (Math::PI) * (@first_number ** 2.0) * @second_number
  when 'rectangular prism'
    @first_number * @second_number * @third_number
  when 'cone'
    (1.0 / 3.0) * (Math::PI) * (@first_number) * @second_number
  when 'capsule'
    (Math::PI) * (@first_number ** 2.0) * ((4.0 / 3.0) * @first_number + @second_number)
  end

  erb :result

end

get '/calc-u-l8r' do
  erb :result
end