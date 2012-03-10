# This file tests console renderer

to make sure that it looks good on all terminals.

## This is a secondary header.
### This is a tertiary header.

**This should be bold**.

*This should be emphasized (underlined)*.

***This should be bold and underlined***.

> This is a quote.

	# This is some code:
	main :: IO ()
	main = hakyllWith config $ do
		# Copy images
		match "images/*" $ do
			route idRoute
			compile copyFileCompiler

- This
- is
- an
- unordered
- list.

1. This
2. Is
3. An
4. Ordered
5. List.

V This is a horizontal rule.

---

^ That was a horizontal rule.

This is inline code: `x+1`, see?

[This is a link](http://adit.io).
![This is an image](http://example.com/test.gif)
