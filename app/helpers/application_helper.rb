module ApplicationHelper
  def markdown(text)
    MyMarkdown.render(text)
  end

  def datetime(datetime)
    datetime.to_time.strftime('%Y-%m-%d %H:%M:%S')
  end
end
