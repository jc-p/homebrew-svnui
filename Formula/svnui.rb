class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.8.0/svnui-0.8.0-x86_64-apple-darwin.tar.gz"
  sha256 "9e177cd4e1a1b63e39c44f5bd156cb77d937566942ca5b6bacfd459bfb4358bd"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.4.2/svnui-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "9ccacc412300628c027c6c6711f538077ec9593d272205f7a08af90996f27173"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.4.2", shell_output("#{bin}/svnui --version")
  end
end
