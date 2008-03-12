puts File.expand_path(File.dirname(__FILE__))

task :generate_doc do
  plugin_path = File.expand_path(File.dirname(__FILE__) + "/..")
  bin_path = "#{plugin_path}/bin"
  doc_path = "#{plugin_path}/doc"
  sh "chmod +x #{bin_path}/bluecloth"
  sh "#{bin_path}/bluecloth #{doc_path}/index.text > #{doc_path}/index.html"
  
  index = File.read("#{doc_path}/index.html")
  index.gsub!(/<html>/, 
    %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
      <html xmlns="http://www.w3.org/1999/xhtml">
    })

  index.gsub!(/<head>(.*?)<\/head>/, 
    %{<head>
        <title>Integration</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="stylesheets/screen.css" type="text/css" media="screen" />
      </head>
    })
  
  File.open("#{doc_path}/index.html", 'w+') do |index_file|
    index_file << index
  end
end
