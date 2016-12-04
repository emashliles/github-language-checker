require 'octokit'

module GithubLanguageChecker
	class LanguageChecker

		def self.check_language(name_to_search)

          begin
			repositories = Octokit.repositories(name_to_search)
			puts "User #{name_to_search} has #{repositories.length} repos."
		  rescue	
			puts 'Cannot connect to Github API at this time.'
		  end

		end
	end
end

#puts 'Please enter a github username:'

#GithubLanguageChecker::LanguageChecker.check_language(gets.chomp())