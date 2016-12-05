require 'octokit'

module GithubLanguageChecker
	class LanguageChecker

		def check_language(name_to_search)

			repositories = get_user_repositories(name_to_search)

			if !repositories.nil?

			  puts "User #{name_to_search} has #{repositories.length} repos."

              most_used_language = find_most_frequent_langauge(repositories)

			  puts "It looks like their favortie language is #{most_used_language}"
		    end
		end
	

	def find_most_frequent_langauge(repositories)
		langauges_used = Hash.new(0)

        repositories.each { |repo| langauges_used[repo.language] += 1 }

        most_used_language = langauges_used.max_by { |k, v| v }[0]

        return most_used_language
	end

	def get_user_repositories(name_to_search)
	  begin
		repositories = Octokit.repositories(name_to_search)
	  rescue
	    puts 'Cannot connect to Github API at this time.'
	  end

	  return repositories
	end

  end
end
 