class PortsRs < Formula
  desc "Rust-powered CLI for inspecting and managing listening ports"
  homepage "https://github.com/EasyXdc/PortsWhisper-Rust"
  version "0.2.5"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/EasyXdc/PortsWhisper-Rust/releases/download/v0.2.5/ports-rs-darwin-arm64.tar.gz"
    sha256 "9bbba4b163c90199eea8e23920e651a9d3e0c34ad001346e03702233f5173ca1"
  else
    url "https://github.com/EasyXdc/PortsWhisper-Rust/releases/download/v0.2.5/ports-rs-darwin-x64.tar.gz"
    sha256 "4d9e6c82b0715f7539d4fea283f9a96a83367efd8a3aabfb1071d66a6beef0a0"
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
