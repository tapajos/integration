%w(test/unit rubygems hpricot).each { |lib| require lib }

class CoverageTest < Test::Unit::TestCase
  COVERAGE_FILE = "coverage/index.html"
  def test_if_application_is_fully_covered
    doc = Hpricot(File.read(COVERAGE_FILE))

    if RUBY_VERSION =~ /1.8/
      files_without_coverage = doc.search("//div[@class='percent_graph_legend']").
                                 search("//tt").
                                 search("[text()!='100.00%']").
                                 search('../../../td[1]/a')
    else
      files_without_coverage = doc.search("//div[@id='AllFiles']").
                                   search("//td[2]").
                                   search("//[text()!='100.0 %']").
                                   search('../td[1]/a/')
    end
    assert files_without_coverage.empty?, "Bad Boy! Coverage is not 100%... \n Files with problem:\n\t#{files_without_coverage.collect{|file_name| file_name.inner_text}.join("\n\t")}"
    puts "Congratulation! Your coverage is 100%!"
  end
end