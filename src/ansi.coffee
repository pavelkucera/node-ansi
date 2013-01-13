
ansi = exports

code = require('./code')
ansi.color = code.color
ansi.format = code.format

ansi.Style = require('./Style')
ansi.style = (color, background, options) ->
	style = new ansi.Style(color, background)
	for key, option of options
		style.set(option)
	return style
