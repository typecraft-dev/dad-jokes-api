require "test_helper"

class DadJokesFlowsTest < ActionDispatch::IntegrationTest
  test "user can create a dad joke" do
    question = "this is a question"
    params = {
      "dad_joke": {
        "question": question,
        "joke_text": "hey there",
        "cringe_level": 50,
      }
    }

    post("/dad_jokes", params:)

    assert_response :ok
    assert_equal question, JSON.parse(response.body)["question"]
  end

  test "user sees dad jokes when they go to index" do
    DadJoke.destroy_all

    first_joke = DadJoke.create!(
      question: "Why did the scarecrow win an award?",
      joke_text: "Because he was outstanding in his field!",
      cringe_level: 75,
    )
    second_joke = DadJoke.create!(
      question: "How does a penguin build its house?",
      joke_text: "Igloos it together!",
      cringe_level: 60,
    )
    third_joke = DadJoke.create!(
      question: "What do you call fake spaghetti?",
      joke_text: "an Impasta!",
      cringe_level: 10,
    )

    get "/"

    assert_equal "200", response.code
    assert_equal 3, JSON.parse(response.body).length
    assert_equal(
      [third_joke.id, second_joke.id, first_joke.id],
      JSON.parse(response.body).map {|joke| joke["id"]}
    )
  end
end
