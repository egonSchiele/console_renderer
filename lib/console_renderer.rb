require 'redcarpet'
require 'rainbow'
require 'syntax/convertors/html'

class ConsoleRenderer < Redcarpet::Render::Base

  def self.syntax_highlight(code, inline=true)
    tokenizer = Syntax.load "ruby"

    c_line = ""

    code.split("\n").each do |line|
      c_line += "    " unless inline
      begin
        bkp = c_line
      tokenizer.tokenize( line ) do |token|
        case token.group.to_s
        when "comment" then c_line = c_line + token.color("#6EE18F")
        when "constant" then c_line = c_line + token.color("#3D3D79")
        when "expr" then c_line = c_line + token.color(:white)
        when "ident" then c_line = c_line + token.color("#AAAAAA")
        when "keyword" then c_line = c_line + token.color("#FF73EC")
        when "normal" then c_line = c_line + token.color(:cyan)
        when "number" then c_line = c_line + token.color("#FF6300")
        when "punct" then c_line = c_line + token.color(:white)
        when "string" then c_line = c_line + token.color(:red)
        when "symbol" then c_line = c_line + token.color(:green)
        else c_line += token
        end
      end
      rescue
        c_line = bkp + line
      end
      c_line += "\n" unless inline
    end
    c_line
  end    

  def block_code(code, language)
    "\n" + (ConsoleRenderer.syntax_highlight(code, false)) + "\n"
  end

  def block_quote(quote)
    ret = ""
    quote.split("\n").each do |line|
      ret += "|".color(:cyan) + line
    end
    ret
  end

  def block_html(raw_html)
    raw_html
  end

  def header(text, header_level)
    text = "\n" + text + "\n"
    if header_level == 1
      text.bright.underline
    else
      text.underline
    end
  end

  def hrule()
    "___________________________".color(:yellow)
  end

  def list(contents, list_type)
    contents
  end

  def list_item(text, list_type)
    "    " + "-".color(:cyan) + " " + text
  end

  def paragraph(text)
    text + "\n"
  end

  def table(header, body)
    body
  end

  def table_row(content)
    content
  end

  def table_cell(content, alignment)
    content
  end

  def autolink(link, link_type)
    link.color(:cyan)
  end

  def codespan(code)
    ConsoleRenderer.syntax_highlight(code)
  end

  def double_emphasis(text)
    text.underline.italic
  end

  def emphasis(text)
    text.italic
  end

  def image(link, title, alt_text)
    ("<" + (alt_text || "") + ">").color(:green) + ("(image at: " + (link || "") + ")").color(:cyan)
  end

  def linebreak()
    "\n\n"
  end

  def link(link, title, content)
    (title || "") + " " + ("<" + link + ">").color(:cyan)
  end

  def raw_html(raw_html)
    raw_html
  end

  def triple_emphasis(text)
    text.bright.italic.underline
  end

  def strikethrough(text)
    text
  end
  
  def superscript(text)
    ("^" + text).color(:red)
  end
end


