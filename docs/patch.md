Plugins are a powerful tool to customize and extend the functionality of your Strapi app. [The Strapi Market](https://market.strapi.io/) is the official marketplace to find plugins comprising more than 60 plugins to choose from. These plugins were developed by the Strapi team, technology and solution partners, and individual community members. You can find plugins that integrate Strapi with other tools, such as Sentry, Mux, and Moesif, and plugins that extend Strapi features, such as SEO, content versioning, comments moderation, internationalization, database configuration, sitemap, and more.

# Introduction

This tutorial aims to show how you can enhance functionality in your Strapi blog, by making use of 3 plugins from the Strapi Market. You will use the official Strapi SEO plugin to make your content more SEO friendly, the Internationalization (i18n) plugin to help distribute the content in different languages, and the Comments plugin to moderate comments on your blog. You will start by creating a simple static blog with Strapi as the backend and Jekyll for the frontend. Then you will install the plugins and show their use cases. At the end of this tutorial, you should know how to install and use plugins from the Strapi Market to power up your app.

## Why Strapi?

[Strapi](https://www.strapi.io) is the leading open-source headless Content Management System (CMS) with over 45000 Github stars. It saves API development time through an advanced and feature rich API CMS. It makes it simpler to access content through provision of fast and secure APIs built in an efficient and scalable manner. 

Strapi is open source *forever*, the entire codebase is available and maintained on Github by thousands of contributors It’s highly customizable with a beautiful admin panel that anyone can use and customize to their preference. The API as well can be customized to one’s needs. content management functionality can be extended through the use of plugins available through the [Strapi Market](https://market.strapi.io). 

The APIs you generate using Strapi can be consumed using any frontend client from vanilla HTML, CSS and Javascript sites to frontend frameworks like React, Vue, Angular etc. to mobile apps and even IoT devices using REST or GraphQL. 

Another reason why Strapi is so compelling is that you can self-host it. That’s right, you can host on your own servers or any other hosting providers. This includes cloud platforms such as 21YunBox, Render, Heroku, AWS, Azure and others or locally using Docker

## What is Strapi Market?

[Strapi Market](https://market.strapi.io) is the official marketplace, listing all the plugins created by the Strapi team, technology and solution partners, as well as individual community members. It is the trusted place where people can access all the submitted plugins. Anyone is free to develop and submit a plugin to the marketplace. All submitted plugins are reviewed through a [Review Process](https://strapi.io/market-guidelines). The verified plugins are highlighted and listed on the marketplace so that every plugin creator’s work is showcased and acknowledged.

## What is Jekyll?

[Jekyll](https://www.jekyllrb.com) is a static site generator (SSG). It takes text written in your favorite markup language and uses layouts to create a static website. You can tweak the site’s look and feel, URLs, the data displayed on the page, and more. Some of the features include permalinks, categories, pages, templates and custom layouts. 

Jekyll was developed using the Ruby language and uses Liquid as its templating language. It is also the SSG powering [Github Pages](https://pages.github.com).

## Goals

The goals of our tutorial are as follows:

- Build a simple static blog using Jekyll and Strapi
- Install and showcase the functionality of the following plugins:
  - [Internationalization (i18n) plugin](https://market.strapi.io/plugins/@strapi-plugin-i18n)
  - [SEO plugin](https://market.strapi.io/plugins/@strapi-plugin-seo)
  - [Comments plugin](https://market.strapi.io/plugins/strapi-plugin-comments)

## Prerequisites

To complete the tutorial, the following prerequisites need to be installed:

### **Backend**

- [Node.js](https://www.nodejs.org): Node.js is the server-side runtime environment used to run our Strapi application. only LTS versions are supported (minimum v12). You can download from the [Downloads | Node.js](https://nodejs.org/en/download/) page and install it using the provided instructions. To check if Node.js has been installed correctly, open up your command line and type `node -v`
- [npm](https://www.npmjs.com/) (minimum v6) or [yarn](https://yarnpkg.com/): the package manager for Node.js to run the CLI scripts. We will use this to install Strapi. npm comes bundled with Node.js. To check your version enter `npm -v` in your shell. If you prefer yarn, follow the instructions on the [Installation | Yarn - Package Manager page](https://yarnpkg.com/getting-started/install) to install it. To check if yarn is installed type `yarn -v` in your shell after installation.

### **Frontend**

- Ruby v2.5.0 or higher, including all development headers (check ruby installation using `ruby -v`)
- RubyGems
- GCC and Make
- Jekyll (minimum v4)

> **NOTE:**
>
> Knowledge of the Ruby language and the Liquid templating language are not necessary to understand and complete the tutorial.

You can find the instructions on how to install Jekyll on the [Installation page for the Jekyll website](https://jekyllrb.com/docs/installation/). 

# Backend Setup

## Strapi Installation

The initial set up for the project involves installing and setting up Strapi as the backend for your Jekyll blog. It will host the content as well as the plugins to power up your blog.

First make sure node and npm/yarn are installed by running `node -v`.

Create a new strapi project, I’ll name mine jekyll-blog-backend

```sh
yarn create strapi-app jekyll-blog-backend --quickstart
```

![Launch Strapi Quickstart](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655741646133_strapi-quickstart-cmd.png)

The strapi server should be running automatically on port 1337. Go to http://localhost:1337/admin in your browser to set up your admin for Strapi.


## Create an Admin User

Add an admin user to your Strapi app from the [registration page](http://localhost:1337/admin/auth/register-admin).


![Strapi Admin User Registration](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655742835181_strapi-new-user-registration.png)

## Create Content Types

Select `Content-Type Builder` from the Strapi Dashboard sidebar to open up the Content-Type Builder page.


![Strapi Content Type Builder Fields](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655743820341_content-type-builder.png)

## Posts

Create a `Collection Type` for posts. Select `Create new Collection Type` and enter a post name. You can name it `Post`. Click on `Advanced Settings` and disable the `Drafts System` then click `Continue`.

Add the following fields to your Post collection type:


- `Text` field with name `title` and type `short text`.
- A `Text` field with the name `description` and type l`ong text`.
- A `Rich Text` field named `content`.

Click `Save` and wait for Strapi to restart. Once Strapi has restarted, "Post" is listed under  *Content Manager > Collection types* in the navigation.


![Strapi Content Type Builder Fields for Posts](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655745241748_strapi-content-type-builder.png)


If you get stuck, refer to the [Strapi Quick Start Guide](https://docs.strapi.io/developer-docs/latest/getting-started/quick-start.html), for detailed instructions.


## Add Relation Field

Let's add a relation between `Post` and `User` from the `users-permissions` plugin. This makes it easier to link a post to a user to display key data like the Author's name and profile picture, posts etc.

Add a new `Relation` field to the `Post` content type. The column on the left should be `Post`, and the column on the right should be `User (from: users-permissions)`. Select the fourth relation:  *User has many Posts* and click `Finish`.


![Strapi Content Type Builder: Relation Field Settings](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655746253469_Strapi-content-type-builder-relation-field.png)


Click `Save` and wait for Strapi to restart for the changes to appear.


## Add Slug UID to Posts

Next, we will add a dynamic auto-generated slug to the `Post` collection.

Go to **Content-Types Builder**  and click **Post**, select **Add another field** and choose **UID** Set the field `Slug` and set the attached field to `title`. Click `Save` and wait for Strapi to restart for the changes to take effect. 


![Add Slug UID field](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655748003383_add-slug-uid.png)


Click on **Configure the view**, and select the `Slug` field. In the `Edit Slug` menu set **Editable Field** to `FALSE`. Click **Finish** and then **Save.** 


![Make slug uneditable](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655748038145_Edit+Slug+Editable+field.png)


Now the slug will be the same as the title for a blog article.


## Add Posts

Let’s create new entries for our blog posts.

Create an entry for the “Post” collection type. Go to  [Content Manager > Collection types - Post](http://localhost:1337/admin/content-manager/collectionType/api::post.post) 

Click on **Create new entry**. Add the **title, description** and **content** to your blog entry, then click **Save**.


![Create Blog post](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655902364716_create-blog-post.png)


Repeat these steps to add multiple blog entries. Feel free to enter any content of your choice. Go to  [Content Manager > Collection types - Post](http://localhost:1337/admin/content-manager/collectionType/api::post.post)  to see a list of your blog entries.


![Post Entry List](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655905563319_blog+post+entries.png)



## Allow Access

For security reasons, the API access is restricted by default. We need to make the content available publicly through the API.

Click on *Settings* under *GENERAL* at the bottom of the main navigation. Under *Users & Permissions Plugin*, choose [Roles](http://localhost:1337/admin/settings/users-permissions/roles). Click the **Public** role. In the *Permissions* tab, find *Post,* click on it and select the checkboxes next to **find** and **findone**. Then **Save**.


![Enable Permissions for Posts](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655905884741_post-users-permissions-api-access.png)


Now, test the link to the API by visiting http://localhost:1337/api/posts. If it’s working you should see an output showing the raw posts data as seen below.

![Working Posts API](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655906428235_Working+Posts+API.png)


Great job, your API is now working. With that the backend is all set.

# Frontend Setup

## Jekyll Installation

The next step is to set up your frontend for the blog. You will install Jekyll CLI and all its prerequisites using the instructions from the [Jekyll installation page](https://jekyllrb.com/docs/installation/). 

Next install the jekyll bundler and gems using the following command:

```sh
$ gem install jekyll bundler
```


## Generate Jekyll project

In the root of your application folder, create a new Jekyll site at `./jekyll-blog` or any other name you prefer to use.

```sh
$ jekyll new jekyll-blog
```

![Generate New Jekyll project](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655907404396_generate-jekyll-project.png)



## Start Development Server

Change directory into your Jekyll project directory.

```sh
$ cd jekyll-blog
```

Build the site and start the server to make it available on your local machine

```sh
$ bundle exec jekyll serve
```

![Start Jekyll Development Server](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655908518894_run+jekyll.png)


Browse to [http://localhost:4000](http://localhost:4000) to see your new Jekyll blog.


![Jekyll blog running in the browser](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655713112489_jekyll-site-running-in-the-browser.png)



> ⚠️ **WARNING:**
>
> For Ruby version 3.0.0 or higher, `bundle exec jekyll serve` [may not work](https://github.com/github/pages-gem/issues/752). You can fix it by adding `webrick` to your dependencies: `bundle add webrick`. See image below
> 
![Jekyll webrick fix](https://paper-attachments.dropbox.com/s_9D9561C99094CEA4A8FAD29310A6CE92ADD3DA95FDE835930B84E0E1343EE13B_1655908836431_webrick-fix.png)

> **NOTE:** 
>
> Add the `--livereload` option to `serve` to automatically refresh the page with each change you make to the source files: `bundle exec jekyll serve --livereload`


## Fetch blog posts

Data for statically generated website can come from varying sources. This can be markdown files, XML files, JSON, CSV, etc.

The default data source for Jekyll is markdown. Fortunately, the data source which is the Strapi REST API is already in markdown format. We need to construct a simple Ruby script to consume the API.

In your Jekyll project directory, create a new ruby file and give it any name you want, I'll name mine `jekapi.rb`. Copy and paste the following source code into `jekapi.rb`.

```ruby
# Ruby script to consume the Strapi API endpoint
require 'net/http'
require 'json'
require 'ostruct'

url = 'http://localhost:1337/api/post?populate=*'
uri = URI(url)
response = Net::HTTP.get(uri)

result = JSON.parse(response, object_class: OpenStruct)

result.data.each do |document|
    url = 'http://localhost:1337/api/posts?populate=*'
uri = URI(url)
response = Net::HTTP.get(uri)

result = JSON.parse(response, object_class: OpenStruct)

result.data.each do |document|
    post_file_name_suffix = document.attributes.Slug
    post_file_name_prefix = document.attributes.createdAt
    post_file_name_prefix.slice!(10..24)
    post_file_name = "#{post_file_name_prefix}-#{post_file_name_suffix}"

    post_file_title = document.attributes.title

    post_file_date = document.attributes.createdAt

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
    post_file.puts("---")
    post_file.puts("#{post_file_content}")
  end

```

Run the script in your terminal:

```sh
$ ruby jekapi.rb
```

Your _posts folder should have your Strapi posts with extension *.md

This Ruby script will fetch the blog posts from the api endpoint http://localhost:1337/api/post?populate=*. Requesting using this URL with a * wildcard query will populate all the fields defined in our Strapi API. Refer to the Strapi Documentation - [REST API: Population & Field Selection](https://docs.strapi.io/developer-docs/latest/developer-resources/database-apis-reference/rest/populating-fields.html#rest-api-population-field-selection) for further details.

The script loops through all the JSON data and creates posts which are added to the _posts folder using the [Jekyll post naming convention](https://jekyllrb.com/docs/posts/#creating-posts).


## Posts list

The next step is to display the list of articles for our blog.

```sh
$ bundle exec jekyll serve
```

The Jekyll site at http://localhost:4000 should now be displaying a list of our Strapi posts on the homepage:

![List articles from Strapi API](https://www.dropbox.com/s/72pjl9tgyik3eak/jekyll-with-strapi-posts.png?raw=1)

Now we have a fully functional blog. You can read any post by clicking the link in the home page. Each post will merge with the theme settings.

All the data from the Strapi API has been successfully retrieved and displayed. This includes the  `title`, `author`, `date`, `description` and `content`.

![Individual Jekyll article from Strapi API](https://www.dropbox.com/s/ex05dwodsujs969/single-post-jekyll-strapi.png?raw=1)

Now that we have set up our blog, let's power it up with some plugins

# **Plugin Setup**

# i18n Plugin

[Internationalization](https://www.w3.org/International/questions/qa-i18n.en#i18n) is the process of developing your software so it can be localized to a particular audience that may vary based on culture, language, or region. For example, it could mean removing all the hard-coded strings in your application and putting them in a JSON file. It is a cool feature you can add to your blog. A blog which supports more than one locale covers a much wider audience.

The [Strapi Internationalization (i18n) Plugin](https://market.strapi.io/plugins/@strapi-plugin-i18n) allows Strapi users to create, manage and distribute translated content in multiple languages. 

## Features

This plugin was developed in house by the Strapi Team. Its features include:
- Admin panel users can create several localized versions of their content
- Developers can build localized projects by fetching and consuming the right content depending on the country/language of the audience

## Installation

Strapi v4 comes with i18n plugin by default. The other way is through `NPM`. To install this plugin, you need to add an NPM dependency to your Strapi application:

```sh
# Using Yarn
yarn strapi install i18n

# Or using NPM
npm run strapi install i18n
```

## Configuration

A `STRAPI_PLUGIN_I18N_INIT_LOCALE_CODE` [**environment variable**](https://docs.strapi.io/developer-docs/latest/setup-deployment-guides/configurations/optional/environment.html#strapi-s-environment-variables) can be configured to set the default locale for your environment. The plugin uses an [ISO country code](https://github.com/strapi/strapi/blob/v4.0.0/packages/plugins/i18n/server/constants/iso-locales.json) as the value for the **environment variable**.

This is useful when a Strapi application is deployed in a production environment, with the i18n plugin enabled

## How to use it i18n with the REST API

Our blog is using Strapi as a REST API endpoint. The i18n plugin adds new features to the REST API:

- a new `locale` parameter to fetch content for a specified locale
- creating and updating localized entries

Our blog will fetch localized entries with the locale parameter. The response to requests will include a string field `locale` for the locale code for the content entry and an object `localizations` which contains a data array of the `id` and `attributes` of the localization.

Go back to your Strapi Admin Dashboard and make sure that internationalization is enabled. Navigate to **General** > **Plugins** and make sure that internationalization is seen on the list of installed plugins: ![List of Installed Plugins in Strapi](https://www.dropbox.com/s/vn222r800pfpy33/list-of-installed-plugins.png?raw=1).

If you face any issues with installation refer to the [Strapi i18n plugin documentation](https://docs.strapi.io/developer-docs/latest/plugins/i18n.html#installation). 

Let's set up a new locale for our blog. Proceed to **Settings** > **Internationalization** and click on **"Add new locale"**. For this tutorial choose **French (fr)**:

![Add new Locale in Strapi](https://www.dropbox.com/s/kmyqlvkyr147bkb/add-new-i18n-locale.png?raw=1)

We need to enable localization for the **Post** collection. Navigate to **Content-Type Builder** > **Post**, click on **Edit**. Inside the pop-up, select **Advanced Settings** and check the box labeled **Enable localization for this Content-Type**. Wait for your server to restart for the changes to take effect:

![Enable Localization for the Content-Type in Strapi](https://www.dropbox.com/s/7zmm8l6ga3icwn0/enable-localization-in-strapi-content-type-builder.png?raw=1)

Next, add translations to your blog posts. Go to **Content Manager** > **COLLECTION TYPES** > **Post**. Select one of your blog post entries. You should see the **INTERNATIONALIZATION** tab in the side panel with a **Locales** drop-down:

![Internationalization available for Collection-Type in Strapi](https://www.dropbox.com/s/x9yjr1j0xpphc5w/strapi-internationalization-enabled-in-collection.png?raw=1)

Click on the **Locales** drop-down and create content for your locale. After selecting your second locale, you’ll be taken to a new page to enter your translated content:

![Create post for French locale](https://www.dropbox.com/s/33y1837w5dj5c32/create-post-for-french-locale.png?raw=1)

Once you’ve created your content click **Save**, repeat the same procedure for the other posts and you should have a few published entries with content available in multiple locales:

![Strapi Posts with multiple Locales](https://www.dropbox.com/s/apwaeq877f4bvhl/strapi-posts-with-multiple-locales.png?raw=1)

At the frontend, we need a way to consume the new locale data for our blog. Update `jekapi.rb` with the locale data from the Strapi API endpoint:

```ruby
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
```

Create a folder for your French content in your Jekyll working directory. Name the folder **fr** to match with the `locale: fr` configured in the Strapi dashboard. Within **fr** create a directory named **_posts**.

Run the `jekapi.rb` script, then launch your Jekyll site. Open one of the posts and add a `/fr/` prefix to the site link to view the French version of your post. There you have it, a simple implementation of internationalization in your website:

![Jekyll Blog Post with multiple locales](https://www.dropbox.com/s/8qgajnb7wo8f5y8/jekyll-blog-post-with-multiple-locales.png?raw=1)

# SEO Plugin

What's a good blog without some [SEO](https://developers.google.com/search/docs/beginner/seo-starter-guide). The [Strapi Team developed the Strapi plugin SEO](https://market.strapi.io/plugins/@strapi-plugin-seo) to help with that.

## Features

- Easily see which Content-Types have the SEO Component or not
- Preview content in the Search Engine Results Page (SERP)
- Manage important meta tags like `metatitle` and `metadescription`
- Manage meta social tags (Facebook and Twitter) for your content
- Strong SEO analysis provided for your content

## Installation

Install the **SEO** plugin by adding it as an NPM dependency to your Strapi backend application.

```sh
# Using Yarn
yarn add @strapi/plugin-seo

# Or using NPM
npm install @strapi/plugin-seo
```

## Configuration

After installing, navigate to `./config/plugins.js` in your Strapi backend and add:

```js
module.exports = ({ env }) => ({
  // ...
  seo: {
    enabled: true,
  },
  // ...
});
```
Build your admin panel, then start your Strapi server:

```sh
$ yarn build
$ yarn develop
```
Your Strapi dashboard should now have **SEO** listed under **Plugins**:

![Strapi Dashboard with SEO Plugin](https://www.dropbox.com/s/rguvoy66xlp5czu/seo-plugin-installed-in-strapi.png?raw=1)

## How to use it



# Cloudinary Provider Plugin

## Features

## Installation

## Configuration

## How to use it

# Conclusion