# Gorilla Blog
Provide simple blog engine for you.

## Getting started
```
git clone https://github.com/tnmtmst/gorilla_blog.git
cd gorilla_blog
bundle install --path vendor/bundle
```

## Theme
### Install third party theme
Deploy theme directory in 'theme'.

### Generate command
```
bundle exec rails g theme <Theme_name>
```

### Files location
View file in `theme/<Theme_name>/views`
Asset file in `theme/<Theme_name>/asset`

### Suported template engine
* erb
* slim

### How to access asset files.
Example.  
`link rel="stylesheet" href="/theme/stylesheets/style.css"`  
=>`theme/assets/stylesheets/style.css`



## Helper method
```
markdown(text)
```
Convert Markdown text to HTML

```
selected_tag_name
```
Get user selected tag name
