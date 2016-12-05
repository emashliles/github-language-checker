require_relative 'github_language_checker.rb'

language_checker = GithubLanguageChecker::LanguageChecker.new

puts 'Please enter a github username:'

language_checker.check_language(gets.chomp) 