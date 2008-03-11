$: << File.dirname(__FILE__) + '/..' << File.dirname(__FILE__) + '/../lib'
%w(test/unit rubygems init hpricot open-uri).each { |lib| require lib }

class CoverageTest < Test::Unit::TestCase
  
  def deny(condition, message='')
    assert !condition, message
  end
  
  # def testa_se_esta_sendo_utilizado_assert_true
  #   deny system("find test/* -name '*.rb' \! -name 'coverage_test.rb' | xargs grep 'assert '"), "Não utilizar assert(). Substituir por assert_true()."
  # end
  
  COVERAGE_FILE = "coverage/index.html"
  def test_if_application_is_fully_covered
   `rake coverage` if !FileTest.exists?(COVERAGE_FILE)
    
    doc = Hpricot(File.read(COVERAGE_FILE))
    arquivos_sem_cobertura = doc.search("//tt[@class='coverage_total']").
                                 search("[text()!='100.0%']").
                                 search('../../../../../../td[1]/a')
    assert arquivos_sem_cobertura.empty?, "Menino mau! Cobertura nao foi total... \n Arquivos sem cobertura total:\n\t#{arquivos_sem_cobertura.collect{|arquivo| arquivo.inner_text}.join("\n\t")}"
    puts "Parabens! Cobertura de 100%!"
  end
  
end