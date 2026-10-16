class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.3.2/svnui-0.3.2-x86_64-apple-darwin.tar.gz"
  sha256 "40ea3fa44a0c7b73e6ce4e1cd0854d2762cfcd2e4a60d27f13714d5bc4cde266"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.3.2/svnui-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "1f6e9c2982f0b853e1a638f386421efa74f06ab9a92df6f0f0a83a68ef41344a"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.3.2", shell_output("#{bin}/svnui --version")
  end
end
