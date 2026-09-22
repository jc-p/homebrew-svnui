class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.3.0/svnui-0.3.0-x86_64-apple-darwin.tar.gz"
  sha256 "cd3504c8177c907b56df5523f77a07f43240b4c54c4bedba6b4bae505a51889a"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.3.0/svnui-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "278dd7d7b63d9aca7ffb026c23771f148d5db8c207c745c64c3918f244848fbb"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/svnui --version")
  end
end
