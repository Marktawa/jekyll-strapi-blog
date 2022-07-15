#jekapi.rb

require 'net/http'
require 'json'
require 'ostruct'

url = 'http://localhost:1337/api/posts?populate=*'
uri = URI(url)
response = Net::HTTP.get(uri)
result = JSON.parse(response, object_class: OpenStruct)
result.data.each do |document|
    post_file_locale_def = document.attributes.locale
    post_file_name_suffix = document.attributes.Slug
    post_file_date = document.attributes.createdAt
    post_file_name_prefix = document.attributes.createdAt
    post_file_name_prefix.slice!(10..24)
    post_file_name = "#{post_file_name_prefix}-#{post_file_name_suffix}"
    post_file_title = document.attributes.title
    post_file_description = document.attributes.description
    post_file_author = document.attributes.author.data.attributes.username
    post_file_content = document.attributes.content

    post_file = File.new("_posts/#{post_file_name}.md", "w")
    post_file.puts("---")
    post_file.puts("layout: post")
    post_file.puts("title: \"#{post_file_title}\"")
    post_file.puts("date: #{post_file_date}")
    post_file.puts("description: #{post_file_description}")
    post_file.puts("author: #{post_file_author}")
    post_file.puts("locale: #{post_file_locale_def}")
    post_file.puts("---")
    post_file.puts("#{post_file_content}")

    post_file_locale = document.attributes.localizations.data[0].attributes.locale
    post_file_title_locale = document.attributes.localizations.data[0].attributes.title
    post_file_description_locale = document.attributes.localizations.data[0].attributes.description
    post_file_content_locale = document.attributes.localizations.data[0].attributes.content

    post_file_alt = File.new("fr/_posts/#{post_file_name}.md", "w")
    post_file_alt.puts("---")
    post_file_alt.puts("layout: post")
    post_file_alt.puts("title: \"#{post_file_title_locale}\"")
    post_file_alt.puts("date: #{post_file_date}")
    post_file_alt.puts("description: #{post_file_description_locale}")
    post_file_alt.puts("author: #{post_file_author}")
    post_file_alt.puts("locale: #{post_file_locale}")
    post_file_alt.puts("---")
    post_file_alt.puts("#{post_file_content_locale}")
  end

