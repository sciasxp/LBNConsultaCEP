#
# Be sure to run `pod lib lint LBNConsultaCEP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LBNConsultaCEP"
  s.version          = "0.0.1"
  s.summary          = "Dado o CEP consulta o endereço no site dos correios."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Faz a busca de um enderaço a partir do CEP fornecido. A busca é baseada na utilização do site dos correios http://www.buscacep.correios.com.br/sistemas/buscacep/resultadoBuscaCepEndereco.cfm.
                       DESC

  s.homepage         = "https://github.com/sciasxp/LBNConsultaCEP"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Luciano Bastos Nunes" => "sciasxp@gmail.com" }
  s.source           = { :git => "https://github.com/sciasxp/LBNConsultaCEP.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LBNConsultaCEP' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'BRYHTMLParser', '~> 2.1.1'
end
