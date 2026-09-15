class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.2.0/svnui-0.2.0-x86_64-apple-darwin.tar.gz"
  sha256 "8e82b2e7bf28842b28b532b5fabe124c132f6d02e764b6909135fcb2e42e36a3"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.2.0/svnui-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "de9c3329658bd8b8d3e7a77e696f8b33bd310af637b8b188d6bf8f6e742a7213"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/svnui --version")
  end
end
