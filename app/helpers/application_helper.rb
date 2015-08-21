module ApplicationHelper
  def markdown(text)
    MyMarkdown.render(text)
  end
end
