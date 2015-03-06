module Web::Views::Matches
  class Index
    include Lotus::View
    template 'matches/index'
  end
end

Lotus::View.configure do
  root 'apps/web/templates'
end
Lotus::View.load!

def matches
  MatchRepository.all
end

Web::Views::Matches::Index.render(format: :html, matches: matches)
