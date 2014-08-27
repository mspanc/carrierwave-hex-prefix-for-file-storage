Gem::Specification.new do |s|
  s.authors = ["Marcin Lewandowski"]
  s.email = ["marcin@saepia.net"]
  s.name = "carrierwave-hex-prefix-for-file-storage"
  s.version = '0.0.1'
  s.summary = %q{Creates efficient directory structure for carrierwave attachments}
  s.description = %q{Enscapsulates directory naming scheme for carrierwave's file storage, enabling creation of directory structure that will be efficient and survive subdirs limit.}
  s.homepage = "http://github.com/mspanc/carrierwave-hex-prefix-for-file-storage"
  s.files = ["README.md", "LICENSE", "lib/", "lib/carrierwave-hex-prefix-for-file-storage.rb"]
  s.require_paths = ["lib"]
  s.add_dependency 'carrierwave'
end