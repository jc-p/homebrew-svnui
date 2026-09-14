class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/jc-p/svnui/releases/download/v0.1.0/svnui-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b2b76757786ab378407b9befc26742aa546e763d4f4ff067ad86b6cb4b7ae661"
    end
    on_intel do
      url "https://github.com/jc-p/svnui/releases/download/v0.1.0/svnui-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "f3e233d939a83b7c9978d98c06b3828e8494886fef2b50dd4d6db5c4fe7383e6"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/svnui --version")
  end
end
