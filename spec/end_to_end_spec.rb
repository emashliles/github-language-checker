require_relative '../github_language_checker.rb'

describe "Github Language Checker" do

  before(:each) do
    @username = "emashliles" 
    @language_checker = GithubLanguageChecker::LanguageChecker.new
  end

	it "displays error when Github API can't be reached" do
		expect(STDOUT).to receive(:puts).with("Cannot connect to Github API at this time.")
		allow(Octokit).to receive(:repositories).with(@username).and_raise("exception")
		@language_checker.check_language(@username)
	end

	it "displays the number of repos a user has and makes a guess at the user's favorite language" do
		expect(STDOUT).to receive(:puts).with("User #{@username} has 27 repos.")
		expect(STDOUT).to receive(:puts).with("It looks like their favortie language is JavaScript")
		@language_checker.check_language(@username)
	end
end