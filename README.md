# SERP Scan API

##### SERP Scan tracks your website's search engine position for the keywords that matter to you.

The serpscan gem is a ruby wrapper for interacting with the SERP Scan API. Before you can use the gem you'll need a SERP Scan account (https://serpscan.com), and an api key which can be found on the accounts page. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'serpscan'
```

And then execute:

$ bundle

Or install it yourself as:

$ gem install serpscan

## Usage

Set your API key. If you're using Rails you may want to place the code below in a file at config/initializer/serpscan.rb.

```ruby
Serpscan.api_key = 'YOUR API KEY'
```

To create a website:

```ruby
Serpscan::Website.create(url: 'example.com')
```

To get a list of the websites currently in your account:


```ruby
Serpscan::Website.all
```

To get a particular website:

```ruby
Serpscan::Website.find(id)
```

To get a list of keywords for a website:

```ruby
website = Serpscan::Website.find(1)
website.keywords
```

To create a keyword:

```ruby
website = Serpscan::Website.find(1)
website.create_keyword(phrase: 'example keyword')
```

## Attributes

Each of these attributes can be called directly on the object. Example:
```
website = Serpscan::Website.find(1)
website.id # => 1
```

Websites:

```Website
[:id, :url] 
```

Keywords:

```ruby
[:id, :phrase, :current_rank, :initial_rank, :day_change, :week_change, :alltime_change, :search_volume, :search_engine_country_id]
```