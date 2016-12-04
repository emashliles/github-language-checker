require_relative '../github_language_checker.rb'

describe "Github Language Checker" do

  before(:each) do
    @username = "emashliles" 
  end

	it "displays error when Github API can't be reached" do
		expect(STDOUT).to receive(:puts).with("Cannot connect to Github API at this time.")
		allow(Octokit).to receive(:repositories).with(@username).and_raise("exception")
		GithubLanguageChecker::LanguageChecker.check_language(@username)
	end

	it "displays the number of repos a user has" do
		expect(STDOUT).to receive(:puts).with("User #{@username} has 27 repos.")
		GithubLanguageChecker::LanguageChecker.check_language(@username)
	end
end