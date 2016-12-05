require_relative '../github_language_checker.rb'

describe "Github Language Checker" do

  before(:each) do
    @username = "emashliles" 
    @language_checker = GithubLanguageChecker::LanguageChecker.new
  end

	it "displays error when Github API throws an error" do
		expect(STDOUT).to receive(:puts).with("There was an issue finding that user from github API.")
		allow(Octokit).to receive(:repositories).with(@username).and_raise("exception")
		@language_checker.check_language(@username)
	end

	it "displays the number of repos a user has and makes a guess at the user's favorite language" do
		expect(STDOUT).to receive(:puts).with("User #{@username} has 27 repos.")
		expect(STDOUT).to receive(:puts).with("It looks like their favortie language is JavaScript")
		@language_checker.check_language(@username)
	end

	it "handles invalid usernames" do
        @invalid_username = "!!!!!!))))))"

	  	expect(STDOUT).to receive(:puts).with("There was an issue finding that user from github API.")
		@language_checker.check_language(@invalid_username)
    end

    it "handles non existant usernames" do
        @non_existant_username = "emashliless"

	  	expect(STDOUT).to receive(:puts).with("There was an issue finding that user from github API.")
		@language_checker.check_language(@non_existant_username)
    end
end