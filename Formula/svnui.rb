class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.2.3/svnui-0.2.3-x86_64-apple-darwin.tar.gz"
  sha256 "721ebf4ae5f31ea9c8d2ace4a7dbda6bd1f3bf0d47b11214256fe0040698ae02"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.2.3/svnui-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "16f7d26331ef53047e76e5080c9404c1334e056e7492756dfbfcc67bee892f34"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.2.3", shell_output("#{bin}/svnui --version")
  end
end
