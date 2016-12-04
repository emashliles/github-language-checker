require_relative '../github_language_checker.rb'

describe "Github Language Checker" do
	it "displays error when Github API can't be reached" do
		expect(STDOUT).to receive(:puts).with("Cannot connect to Github API at this time.")
		GithubLanguageChecker::LanguageChecker.check_language('emashliles')
	end
end