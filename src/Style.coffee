
module.exports = class Style
	###* @type {} ###
	codes: null


	###*
		@param {int} [color]
		@param {int} [background]
	###
	constructor: (color, background) ->
		@codes = {}
		@color(color)
		@colorBackground(background)


	###*
		@param {int} code
		@return {Ansi}
	###
	color: (code) ->
		@codes.foreground = code
		return @


	###*
		@param {int} code
		@return {Ansi}
	###
	colorBackground: (code) ->
		if 30 <= code <= 37
			code += 10
		@codes.background = code
		return @


	###*
		@param {int} code
		@return {Ansi}
	###
	set: (code) ->
		@codes[code] = code
		return @


	###*
		@param
	###
	unset: (code) ->
		delete @codes[code]
		return @


	###*
		@param {string} text
		@return {string}
	###
	format: (text) ->
		result = `'\033['`
		for key, code of @codes
			if !code
				continue
			result += code
			result += ';'

		result += 'm'
		result += text
		result += `'\033[0m'`
		return result
