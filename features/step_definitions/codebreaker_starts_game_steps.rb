class Output
  
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

end

output ||= Output.new



Given /^I am not yet playing$/ do
end

When /^I start the game$/ do
  @game = Codebreaker::Game.new(output)
  @game.start('1234')

end

Then /^I should see "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Then /^I should be prompted with "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Given /^the code is "(.*?)"$/ do |secret|
  @game = Codebreaker::Game.new(output)
  @game.start(secret)
end

When /^I submit "(.*?)"$/ do |guess|
  @game.guess(guess)
end

Then /^I should get the mark "(.*?)"$/ do |mark|
  output.messages.should include(mark)
end

