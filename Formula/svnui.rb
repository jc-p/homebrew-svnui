class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.2.4/svnui-0.2.4-x86_64-apple-darwin.tar.gz"
  sha256 "1cdd22d1c1bac2f48c2789f756a565808db4bfc95da9b944ec64cfd6364113f2"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.2.4/svnui-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "04438ad708c0912a719e1b26ff4234a6cdcbad69923160dbd0f2d6d6192e17c0"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.2.4", shell_output("#{bin}/svnui --version")
  end
end
