class Svnui < Formula
  desc "Subversion with a real TUI: status, diff, commit, conflicts"
  homepage "https://github.com/jc-p/svnui"
  license "MIT"

  # 使用 if: OS.arch 来为不同架构指定不同的下载链接
  # 这是 Homebrew 官方推荐的写法，可以确保解析器能正确识别到 url 字段
  url "https://github.com/jc-p/svnui/releases/download/0.1.1/svnui-0.1.1-aarch64-apple-darwin.tar.gz" if OS.arch == :arm64
  url "https://github.com/jc-p/svnui/releases/download/0.1.1/svnui-0.1.1-x86_64-apple-darwin.tar.gz" if OS.arch == :x86_64

  # 同样，sha256 也需要对应修改
  sha256 "a343d2c7e74349aa42b1aa62433ec5830dfa3ea42ac6b4b6d004df158d6cfa4b" if OS.arch == :arm64
  sha256 "2a5666f5163aa9c7752a0fe24e9ed3f0140de5babe647c01217a632e76638d32" if OS.arch == :x86_64

  def install
    bin.install "svnui"
  end

  test do
    # --version 由 clap 的 #[command(version)] 提供
    assert_match "0.1.1", shell_output("#{bin}/svnui --version")
  end
end
