require "test_helper"

class Queries::DadJokeQueryTest < ActiveSupport::TestCase
  test "#query will filter out empty dad jokes" do
    create_list(:dad_joke, 2)
    create(:dad_joke, joke_text: "")

    assert 1, Queries::DadJokeQuery.new.query.length
  end
end
