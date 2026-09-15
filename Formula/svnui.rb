class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.1.1/svnui-0.1.1-x86_64-apple-darwin.tar.gz"
  sha256 "2a5666f5163aa9c7752a0fe24e9ed3f0140de5babe647c01217a632e76638d32"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.1.1/svnui-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "a343d2c7e74349aa42b1aa62433ec5830dfa3ea42ac6b4b6d004df158d6cfa4b"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/svnui --version")
  end
end
