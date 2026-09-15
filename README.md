# homebrew-svnui

[svnui](https://github.com/jc-p/svnui) 的 Homebrew Tap —— SVN 的终端 TUI 客户端。

## 安装

```bash
brew tap jc-p/svnui
brew trust jc-p/svnui
brew install svnui
```

三条都别省，原因见下面「常见问题」。

## 升级

```bash
brew upgrade svnui
```

## 卸载

```bash
brew uninstall svnui
brew untap jc-p/svnui
```

## 常见问题

### 1. 报 `No available formula`

多半是漏了 `brew trust`。

新版 Homebrew 对第三方 tap 加了信任门槛：tap 里的 `.rb` 是 Ruby 代码，会在你机器上执行，所以必须先显式确认来源。没 trust 的话 brew 会**静默忽略整个 tap**，报错是「找不到」，而不是 404 —— 很容易误判成包没发布。

```bash
brew trust jc-p/svnui
```

### 2. 首次运行弹「来自身份不明的开发者」

这是 macOS 的 Gatekeeper。从网络下载的二进制会带 quarantine 标记：

```bash
sudo xattr -d com.apple.quarantine $(which svnui)
```

（本地 `cargo build` 出来的没这问题，所以开发者自己往往遇不到。）

### 3. 下载卡住 / 超时

GitHub Releases 的文件实际走 `objects.githubusercontent.com`，国内网络访问不稳定。表现是下载中断、brew 报 `Download failed`，但换个时间又能通。

可以手动装，把二进制放到内网可达的位置：

```bash
curl -L -o /tmp/svnui.tar.gz <内网地址>/svnui-0.1.1-aarch64-apple-darwin.tar.gz
tar -xzf /tmp/svnui.tar.gz -C /usr/local/bin
xattr -d com.apple.quarantine /usr/local/bin/svnui
```

Apple Silicon 用 `aarch64`，Intel Mac 用 `x86_64`。

### 4. `brew install` 报 checksum mismatch

版本号升级后偶发，通常是本地 tap 缓存没刷新：

```bash
brew update --force
brew upgrade svnui
```

## 支持的系统

macOS（Apple Silicon / Intel 都有预编译包）。
