class HashtagsController < ApplicationController
  def show
    @search = Search.new(term: hashtag)
  end

  private

  def hashtag
    @hashtag = params[:id]
  end
end
