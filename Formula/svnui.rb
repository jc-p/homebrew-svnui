class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/jc-p/svnui/releases/download/v0.1.0/svnui-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "925094a7c50d87019b2ec1359492a232af2da64cd960d1d04f0c61dc0c812a09"
    end
    on_intel do
      url "https://github.com/jc-p/svnui/releases/download/v0.1.0/svnui-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "73cd09fe5669c904be33357398ba8788c9408242496d29b64fc6ba9c6e913f09"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/svnui --version")
  end
end
