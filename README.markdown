# ConsoleRenderer

Sometimes you want to read a Markdown document without having to render it to HTML and open a browser. ConsoleRenderer allows you to render a Markdown document and read it right from the command line.

ConsoleRenderer is available:

## As an executable

	console_renderer [markdown doc]
	echo '#hello' | console_renderer
	cat [markdown doc] | console_renderer

## Example

![console_renderer example](http://static.adit.io/images/console_renderer.png)

## As a gem

	require 'redcarpet'
	require 'console_renderer'
	m = Redcarpet::Markdown.new(ConsoleRenderer)
	puts m.render("# Title \n para")

## Install

	gem install console_renderer
