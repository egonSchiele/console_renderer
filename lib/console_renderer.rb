require 'redcarpet'
require 'rainbow'
require 'syntax/convertors/html'

class ConsoleRenderer < Redcarpet::Render::Base

  @@listitemid = 0
  def self.syntax_highlight(code, inline=true)
    tokenizer = Syntax.load "ruby"

    c_line = ""

    code.split("\n").each do |line|
      c_line += "    " unless inline
      begin
        bkp = c_line
      tokenizer.tokenize( line ) do |token|
        case token.group.to_s
        when "comment" then c_line = c_line + Rainbow(token).color(:green)
        when "constant" then c_line = c_line + Rainbow(token).color(:blue)
        when "expr" then c_line = c_line + Rainbow(token).color(:red)
        when "ident" then c_line = c_line + Rainbow(token).color(:white)
        when "keyword" then c_line = c_line + Rainbow(token).color(:yellow)
        when "normal" then c_line = c_line + Rainbow(token).color(:cyan)
        when "number" then c_line = c_line + Rainbow(token).color(:red)
        when "punct" then c_line = c_line + Rainbow(token).color(:white)
        when "string" then c_line = c_line + Rainbow(token).color(:red)
        when "symbol" then c_line = c_line + Rainbow(token).color(:green)
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
    ret = "\n"
    quote.split("\n").each do |line|
      ret += Rainbow("|").color(:cyan) + line + "\n"
    end
    ret + "\n"
  end

  def block_html(raw_html)
    raw_html
  end

  def header(text, header_level)
    text = "\n" + text + "\n"
    if header_level == 1
      Rainbow(text).bright.underline
    else
      Rainbow(text).underline
    end
  end

  def hrule()
    Rainbow("___________________________\n").color(:yellow)
  end

  def list(contents, list_type)
    @@listitemid = 0
    contents
  end

  def list_item(text, list_type)
    case list_type
    when :unordered
      "    " + Rainbow("-").color(:cyan) + " " + text
    when :ordered
      @@listitemid += 1
      "    " + Rainbow(@@listitemid.to_s + ".").color(:cyan) + " " + text
    end
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
    Rainbow(link).color(:cyan)
  end

  def codespan(code)
    ConsoleRenderer.syntax_highlight(code)
  end

  def double_emphasis(text)
    Rainbow(text).bright
  end

  def emphasis(text)
    Rainbow(text).underline
  end

  def image(link, title, alt_text)
    Rainbow("<" + (alt_text || "") + ">").color(:green) + Rainbow("(image at: " + (link || "") + ")").color(:cyan)
  end

  def linebreak()
    "\n\n"
  end

  def link(link, title, content)
    (content || "") + " " + Rainbow("<#{link}#{title ? " :" + title : ''}>").color(:cyan)
  end

  def raw_html(raw_html)
    raw_html
  end

  def triple_emphasis(text)
    Rainbow(text).bright.underline
  end

  def strikethrough(text)
    text
  end
  
  def superscript(text)
    Rainbow("^" + text).color(:red)
  end
end
