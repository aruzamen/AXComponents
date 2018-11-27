
Pod::Spec.new do |s|

  s.name         = "AXComponents"
  s.version      = "0.1.8"
  s.summary      = "Apptegy UI Components classes"
  s.homepage     = "https://github.com/aruzamen/AXComponents"

  s.description  = <<-DESC
                   Main Classes for Apptegy UI Components section
                   DESC

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Marcelo Aruzamen" => "marcelo@apptegy.com" }

  s.source       = { 
    :git => "https://github.com/aruzamen/AXComponents.git", 
    :tag => s.version
  }

  s.platform = :ios, '10.3'
  s.swift_version = "4.1"
  s.source_files  = "*.swift"
  s.resources     = "*.xib", "Images/**/*.png"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true

end
