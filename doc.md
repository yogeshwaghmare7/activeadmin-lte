# Helpers

> Helpers u can use to generate **components**
> or **plugins** in your pages.

>To render result of helper in page, all **helpers** method should be imbriced in *Active Admin Arbre compenent* ( **para** or **div**) or **active admin DSL** method.

```ruby
# Example
div do
  modal_trigger(tag: :link,
    options: {
      target: 'm_test', text: 'lolol', css_class: 'btn bg-green'
    })
end
```

### Modal trigger button
> Generate modal trigger button. Button can be link or button
```ruby
# tag can be :link or :button
# target is modal id
modal_trigger(tag: :link,
  options: {
    target: 'm_test', text: 'lolol', css_class: 'btn bg-green'
  }
)
```

### Modal
> Generate and render modal with content
```ruby
# Type value is [:default, :success, :warning, :danger, :info]
# Block content converted to modal content
modal_for(heading: {id: 'testModal', title: 'Oops!', type: 'default'}) do
  "Armand Niampa"
end
```

### Button
> Button can be are link or button
```ruby
# if tag is button, options must be:
# type can have :button or :submit as a value
options: {
  type: :submit,
  css_class: 'btn bg-blue',
  text: "#{ActiveAdmin::LTE.icon('fa-skype')} Generate token"
}
```
```ruby
# if tag is link, options must be:
options: {
  url: some_path,
  css_class: 'btn btn-danger',
  text: "#{ActiveAdmin::LTE.icon('fa-google')} Generate token"
}
```
```ruby
lte_button(tag: :button, options: options)
```

### Simple info box
> This method generate lte simple info box.
```ruby
info_box(
  color: :yellow, icon: 'fa-flag-o',
  data: {
    text: 'Wtf',
    number: '13,123'
  }
)
```

### Info box with progress bar
> Generate info box with progress bar
```ruby
# progress is progress bar value exprimed in percent
info_box_progress(
  color: :aqua, icon: 'fa-star-o',
  data: {
    text: 'Likes', number: '93,123', progress: 70,
    description: 'The only thing'
  }
)
```

### Crarousel
> Generate carousel for display images.
> Follow back example to use
```ruby
# id is carousel id.
# images is a image collection.
# image is a open struct and attributes are:
# - src         | link to get image
# - description | image description. This is optional.
div do
  images = %w(media logo thumbnail pitch_photo market_photo).map do |p|
    image = OpenStruct.new
    image.description = I18n.t("media.#{p}")
    image.src = media_path(resource.send(field))
    image
  end
  carousel(id: 'sheet_images', images: images)
end
```

### Active Admin sidebar
> I implemented more new options in sidebar method for visual. All the new options are optional. See the example
```ruby
# border(true or false). Add border under panel border.
# collapse(true or false). Add collapse action in panel.
# type is panel color. (:default, :danger, :info, :success, :warning)
# icon is used in title. font-awesome font
sidebar 'Actions', only: :show, border: true, collapse: true, type: :danger, icon: 'fa-star-o' do
    para project_sheet.pitch.try :html_safe
end
```

### Active Admin panel
> I implemented more new options in sidebar method for visual. All the new options are optional. See the example
```ruby
# border(true or false). Add border under panel border.
# collapse(true or false). Add collapse action in panel.
# type is panel color. (:default, :danger, :info, :success, :warning)
# icon is used in title. font-awesome font
panel 'User', border: true, type: :info, icon: 'fa-user' do
  attributes_table_for user do
    row :id
    row :first_name
    row :last_name
    row :address
  end
end

panel 'project', collapse: true, type: :danger, icon: 'fa-bank' do
  attributes_table_for project do
    row :id
    row :title
    row :localisation
    row :user
  end
end
```

Type can have value in this list: [:default]
  * See HTML in the right
  * Magic

is a cloud-enabled, mobile-ready, offline-storage, AngularJS powered HTML5 Markdown editor.

  - Type some Markdown on the left
  - See HTML in the right
  - Magic

Markdown is a lightweight markup language based on the formatting conventions that people naturally use in email.  As [John Gruber] writes on the [Markdown site][df1]

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Version
3.2.0

### Tech

Dillinger uses a number of open source projects to work properly:

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [Marked] - a super fast port of Markdown to JavaScript
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [keymaster.js] - awesome keyboard handler lib by [@thomasfuchs]
* [jQuery] - duh

And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

### Installation

You need Gulp installed globally:

```sh
$ npm i -g gulp
```

```sh
$ git clone [git-repo-url] dillinger
$ cd dillinger
$ npm i -d
$ mkdir -p downloads/files/{md,html,pdf}
$ gulp build --prod
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins

* Dropbox
* Github
* Google Drive
* OneDrive

Readmes, how to use them in your own application can be found here:

* [plugins/dropbox/README.md] [PlDb]
* [plugins/github/README.md] [PlGh]
* [plugins/googledrive/README.md] [PlGd]
* [plugins/onedrive/README.md] [PlOd]

### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantanously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma start
```

### Todos

 - Write Tests
 - Rethink Github Save
 - Add Code Comments
 - Add Night Mode

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [@thomasfuchs]: <http://twitter.com/thomasfuchs>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [marked]: <https://github.com/chjj/marked>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [keymaster.js]: <https://github.com/madrobby/keymaster>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]:  <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
