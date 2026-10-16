class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.4.0/svnui-0.4.0-x86_64-apple-darwin.tar.gz"
  sha256 "b49f00aff740c3858245e2eea3262772f97f74819b7d95b35f284167df32e521"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.4.0/svnui-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "c78fef21ad5e9b69b664dbb1bb80c30d7253326683f6d3a3c4d5372bb7506839"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/svnui --version")
  end
end
