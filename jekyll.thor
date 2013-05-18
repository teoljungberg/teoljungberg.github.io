require "stringex"

class Jekyll < Thor
  desc "new", "create a new post"
  def new(*title)
    title = title.join(" ")
    date = Time.now.strftime('%Y-%m-%d')
    filename = "_posts/#{date}-#{title.to_url}.md"

    if File.exist?(filename)
      abort("#{filename} already exists!")
    end

    puts "Creating new post: #{filename}"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: post"
      post.puts "published: false"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "---"
    end

    system("vim", filename)
  end
end
