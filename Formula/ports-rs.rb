class PortsRs < Formula
  desc "Rust-powered CLI for inspecting and managing listening ports"
  homepage "https://github.com/EasyXdc/PortsWhisper-Rust"
  version "0.2.4"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/EasyXdc/PortsWhisper-Rust/releases/download/v0.2.4/ports-rs-darwin-arm64.tar.gz"
    sha256 "22400184bd34726231da64981cd16b3804f8583f6796d698369ab2ff2c91b3b1"
  else
    url "https://github.com/EasyXdc/PortsWhisper-Rust/releases/download/v0.2.4/ports-rs-darwin-x64.tar.gz"
    sha256 "15caa2c4bafa5e825135efd2f6167d37369a5fa76efc3992dbbbe9e43a6c057d"
  end

  def install
    bin.install "ports"
    bin.install "whoisonport"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ports --help")
    assert_match "Usage:", shell_output("#{bin}/whoisonport --help")
  end
end
