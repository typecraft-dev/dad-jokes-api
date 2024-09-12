module Queries
  class DadJokeQuery
    def initialize
      @query = DadJoke.all
    end

    def query
      @query = sort_by_cringe
      @query = filter_out_empty_jokes
    end

    private

    def sort_by_cringe
      @query.order(:cringe_level)
    end

    def filter_out_empty_jokes
      @query.where.not(joke_text: nil)
    end
  end
end
