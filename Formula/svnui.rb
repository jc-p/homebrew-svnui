class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.3.1/svnui-0.3.1-x86_64-apple-darwin.tar.gz"
  sha256 "7bfa5bc06b706133f92ab9093f7942cd1af2182756645653256e47a70ebf6fd3"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.3.1/svnui-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "91a2a60ac79fa5e89cb0afd0a94c0093f8e65e0623d85cae198cab9cc4575c0b"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/svnui --version")
  end
end
