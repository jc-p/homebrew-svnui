class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.2.2/svnui-0.2.2-x86_64-apple-darwin.tar.gz"
  sha256 "d742c8aab1a6d7e23a43aea43d27e62a143c21340ac027a17cb83095748866b8"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.2.2/svnui-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "bcbc77174a67e9e0c5477f75eb22c47358ac8bcc9b15e564c7a0af4179401ed6"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/svnui --version")
  end
end
