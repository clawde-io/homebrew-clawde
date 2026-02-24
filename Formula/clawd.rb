class Clawd < Formula
  desc "ClawDE daemon — AI session management for Claude, Codex, and Cursor"
  homepage "https://clawde.io"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clawde-io/apps/releases/download/v0.1.0/clawd-aarch64-apple-darwin"
      sha256 "420baf46ab6eadb0097d62926fdbd5b4029acba71f84f6b1f6d390f56a684dac"
    else
      url "https://github.com/clawde-io/apps/releases/download/v0.1.0/clawd-x86_64-apple-darwin"
      sha256 "2d887e0c2525df6e8da74dbd288d30b9a7c9e9afeead7a74b625ba6cec4eb488"
    end
  end

  on_linux do
    url "https://github.com/clawde-io/apps/releases/download/v0.1.0/clawd-x86_64-unknown-linux-gnu"
    sha256 "6292a9cae2d0c25dac966fd9dd642e6c19d08fc5045d601bd8ea56b81ff918f2"
  end

  def install
    bin.install Dir["clawd-*"].first => "clawd"
  end

  def post_install
    ohai "ClawDE daemon installed!"
    ohai "Run: clawd start"
    ohai "Docs: https://clawde.io/docs"
  end

  test do
    assert_match "clawd", shell_output("#{bin}/clawd --version")
  end
end
