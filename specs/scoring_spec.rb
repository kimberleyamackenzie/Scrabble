require_relative 'spec_helper'

describe "ScoringClass" do
  describe 'initiate scoring class' do
    it "creates an instance of scoring" do
      score = Scrabble::Scoring.new
      score.must_be_instance_of Scrabble::Scoring
    end
  end
  describe "score method" do
    it 'returns total score for word' do
      score = Scrabble::Scoring.score("cats")
      score.must_equal 6
    end
  end
  describe "all-tile bonus" do
    it "adds a 50 point bonus if word has 7 letters" do
      score = Scrabble::Scoring.score("loudest")
      score.must_equal 58

      newscore = Scrabble::Scoring.score("loudes")
      newscore.must_equal 7
    end
  end
  describe "highest scoring word" do
    it "returns the word with the highest score" do
      array = ["Billy", "Goat", "Nathan", "zzzz"]
      highest = Scrabble::Scoring.highest_scoring_word(array)
      highest.must_equal "zzzz"
    end

    it "returns the word with the fewest tiles if there is a tie" do
      array = ["bob", "zzzz", "zzkkkk","billy"]
      tie = Scrabble::Scoring.highest_scoring_word(array)
      tie.must_equal "zzzz"
    end


    it "returns the word that uses 7 tiles for bonus if there is a tie" do
      array = ["bob", "zzzz", "zzkkkk","zzzdddf","billy"]
      seven = Scrabble::Scoring.highest_scoring_word(array)
      seven.must_equal "zzzdddf"
    end

    it "returns the first supplied word if there is a tie in score and in length" do
      array = ["dog", "cat"]
      first_tie = Scrabble::Scoring.highest_scoring_word(array)
      first_tie.must_equal "dog"

      array = ["a", "cat", "b", "dog", "e"]
      first_tie = Scrabble::Scoring.highest_scoring_word(array)
      first_tie.must_equal "cat"
    end
  end
end