class Argus < Formula
  desc "Security gateway for AI agent and MCP package installation"
  homepage "https://github.com/argusgate/argus"
  url "https://github.com/argusgate/argus/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2abb16c9f49d147f7eaee7793d88113acbd01c9dfa0260137afdcd4ec00c9e33"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/argus/"
  end

  test do
    assert_match "usage: argus install", shell_output("#{bin}/argus 2>&1", 1)
  end
end
