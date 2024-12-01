def rails_environment
  Rails.env
end

if defined?(Rails)
  def colorize(text, color_code) = "\e[#{color_code}m#{text}\e[0m"
  def red(text) = colorize(text, 31)
  def green(text) = colorize(text, 32)
  def blue(text) = colorize(text, 36)

  prompt = case rails_environment
  when "development"
             green(rails_environment)
  when "production"
             "\e[1;41;97m!!PRODUCTION!!\e[0m #{red(rails_environment)}"
  else
             blue(rails_environment)
  end

  IRB.conf[:PROMPT][:RAILS] = {
    PROMPT_I: "#{prompt}>",
    PROMPT_N: "#{prompt}>",
    PROMPT_S: "#{prompt}*",
    PROMPT_C: "#{prompt}?",
    RETURN: " => %s\n"
  }

  IRB.conf[:PROMPT_MODE] = :RAILS
end
