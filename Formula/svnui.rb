class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.4.1/svnui-0.4.1-x86_64-apple-darwin.tar.gz"
  sha256 "2719e53e93695baaf47a41d25db3a7340684637d3b5244099db0ee49fa8fc4e4"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.4.1/svnui-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "16b3626636f598ba45c10f93bc96de8045ba6c80ce6e32075aaa8a22f464057c"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/svnui --version")
  end
end
