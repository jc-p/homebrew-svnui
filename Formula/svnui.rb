class Svnui < Formula
    desc "Subversion wrapper with a terminal user interface"
    homepage "https://github.com/jc-p/svnui"
    url "https://github.com/jc-p/svnui/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "替换成实际的 SHA256"
    license "MIT"

    depends_on "rust" => :build
    depends_on "subversion"

    def install
      system "cargo", "install",
             "--locked",
             "--root", prefix,
             "--path", "."
    end

    test do
      system bin/"svnui", "--version"
    end
  end
