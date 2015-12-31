# dashing.wunderlist

## Preview
![](https://raw.githubusercontent.com/sbaerlocher/dashing.wunderlist/master/wunderlist.png)

## Description

Widget for [Dashing](http://dashing.io/) that shows [Wunderlist](https://wunderlist.com) tasks.

## Usage

Add this to your Gemfile and run `bundle install`:
```bash
gem 'rest-client'
```

To use this widget, copy `wunderlist.html`, `wunderlist.coffee`, and `wunderlist.scss` into a `/widgets/wunderlist` directory, and copy the `wunderlist.rb` file into your `/jobs` folder.

To include the widget in a dashboard, add the following snippet to the dashboard layout file:

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
    <div data-id="wunderlist" data-view="Wunderlist"></div>
</li>
```

## Changelog

### 1.0

* Initial release
 
## Contributor

* [Simon Bärlocher](https://sbaerlocher.ch)
 
## License

This project is under the MIT License. See the [LICENSE](https://sbaerlo.ch/licence) file for the full license text.

## Copyright

(c) 2015, Simon Bärlocher