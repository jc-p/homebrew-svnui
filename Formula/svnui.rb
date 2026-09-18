class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"

  # 默认使用 x86_64 的 URL（作为所有平台的回退）
  url "https://github.com/jc-p/svnui/releases/download/0.2.5/svnui-0.2.5-x86_64-apple-darwin.tar.gz"
  sha256 "f8a7b5147fe1a31367dbf7119494ec1644aabb8e276c5d48b4ea58a48e9a5d08"

  license "MIT"

  # 针对 macOS ARM 架构覆盖 URL 和 sha256
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jc-p/svnui/releases/download/0.2.5/svnui-0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "493e548163a3493b9eb6ca122491e644d2da192aaa33aabe7dd7b30319fe1c0f"
    end
  end

  def install
    bin.install "svnui"
  end

  test do
    assert_match "0.2.5", shell_output("#{bin}/svnui --version")
  end
end
