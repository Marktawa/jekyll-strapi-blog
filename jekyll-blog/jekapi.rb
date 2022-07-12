require 'net/http'
require 'json'
require 'ostruct'

response = File.read('db.json')

result = JSON.parse(response, object_class: OpenStruct)

result.data.each do |document|
    post_file_name_suffix = document.attributes.slug
    post_file_name_prefix = document.attributes.createdAt
    post_file_name_prefix.slice!(10..24)
    post_file_name = "#{post_file_name_prefix}-#{post_file_name_suffix}"

    post_file_title = document.attributes.title

    post_file_date = document.attributes.createdAt

    post_file_category = document.attributes.category.data.attributes.name

    post_file_description = document.attributes.description

    post_file_author = document.attributes.author.data.attributes.name

    post_file_content = document.attributes.content

    post_file = File.new("_posts/#{post_file_name}.md", "w")
    post_file.puts("---")
    post_file.puts("layout: post")
    post_file.puts("title: \"#{post_file_title}\"")
    post_file.puts("date: #{post_file_date}")
    post_file.puts("category: #{post_file_category}")
    post_file.puts("description: #{post_file_description}")
    post_file.puts("author: #{post_file_author}")
    post_file.puts("---")
    post_file.puts("#{post_file_content}")
  end



