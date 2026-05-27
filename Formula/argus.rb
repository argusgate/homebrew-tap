class Argus < Formula
  desc "Security gateway for AI agent and MCP package installation"
  homepage "https://github.com/argusgate/argus"
  url "https://github.com/argusgate/argus/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "7adb9133df06712776df3f45cb055c6952865b49049eec60e85e835b437b750d"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/argus/"
  end

  test do
    assert_match "usage: argus install", shell_output("#{bin}/argus 2>&1", 1)
  end
end
