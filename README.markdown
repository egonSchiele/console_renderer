# ConsoleRenderer

Sometimes you want to read a Markdown document without having to render it to HTML and open a browser. ConsoleRenderer allows you to render a Markdown document and read it right from the command line.

ConsoleRenderer is available:

## As an executable

	console_render [markdown doc]
	echo '#hello' | console_render
	cat [markdown doc] | console_render

## Example

	![console_renderer example](http://static.adit.io/console_renderer.png)

## As a gem

	require 'console_renderer'
	m = Redcarpet::Markdown.new(ConsoleRenderer)
	puts m.render("# Title \n para")

## Install

	gem install console_renderer
