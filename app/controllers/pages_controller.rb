class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    phrases = ['“The books that the world calls immoral are books that show the world its own shame.” ―Oscar Wilde',
      '“Books are a uniquely portable magic.” ―Stephen King', '
      “... a mind needs books as a sword needs a whetstone, if it is to keep its edge.”
      ―George R.R. Marti', '“Only the very weak-minded refuse to be influenced by literature and poetry.”
      ―Cassandra Clare', '
      “A great book should leave you with many experiences, and slightly exhausted at the end. You live several lives while reading.”
      ―William Styron']

    @line = phrases[rand(0..4)]
  end
end
