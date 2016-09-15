Pod::Spec.new do |s|
  s.name         = "SUPSemVer"
  s.version      = "1.0.4"
  s.summary      = "Easy-to-use Semantic Version comparison framework"
  s.description  = <<-DESC
                   # SUPSemVer

                   An easy to use framework for comparing semantic versions.

                   DESC

  s.homepage     = "https://github.com/davidrothera/SUPSemVer"
  s.license      = "MIT"
  s.author             = { "David Rothera" => "david.rothera@gmail.com" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/davidrothera/SUPSemVer.git", :tag => s.version.to_s }
  s.source_files  = "SUPSemVer"
end
