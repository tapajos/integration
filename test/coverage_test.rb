$: << File.dirname(__FILE__) + '/..' << File.dirname(__FILE__) + '/../lib'
%w(test/unit rubygems init hpricot open-uri).each { |lib| require lib }

class CoverageTest < Test::Unit::TestCase
  
  def deny(condition, message='')
    assert !condition, message
  end
  
  COVERAGE_FILE = "coverage/index.html"
  def test_if_application_is_fully_covered
   `rake coverage` if !FileTest.exists?(COVERAGE_FILE)
    
    doc = Hpricot(File.read(COVERAGE_FILE))
    files_without_coverage = doc.search("//tt[@class='coverage_total']").
                                 search("[text()!='100.0%']").
                                 search('../../../../../../td[1]/a')
    assert files_without_coverage.empty?, "Bad Boy! Coverage is not 100%... \n Files with problem:\n\t#{files_without_coverage.collect{|file_name| file_name.inner_text}.join("\n\t")}"
    puts "Congratulation! Your coverage is 100%!"
  end
  
end