module NotesHelper
  def render_with_collections(body)
    body.gsub(/#\w+/){|word| link_to word, "/notes/collection/#{word.delete('#')}"}.html_safe
  end
end
