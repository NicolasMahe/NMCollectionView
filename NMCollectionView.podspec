
Pod::Spec.new do |s|
  s.name             = 'NMCollectionView'
  s.version          = '0.0.2'
  s.summary          = 'Improved UICollectionView'
  s.description      = <<-DESC
An improved version of UICollectionView.
                       DESC

  s.homepage         = 'https://github.com/NicolasMahe/NMCollectionView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicolas Mahé' => 'nicolas@mahe.me' }
  s.source           = { :git => 'https://github.com/NicolasMahe/NMCollectionView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'NMCollectionView/**/*.swift'

  s.frameworks = 'UIKit'
  s.dependency "SnapKit", "~> 3.0"
  s.dependency 'PromiseKit', '~> 4.1'

end
