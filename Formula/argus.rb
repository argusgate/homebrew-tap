class Argus < Formula
  desc "Security gateway for AI agent and MCP package installation"
  homepage "https://github.com/argusgate/argus"
  url "https://github.com/argusgate/argus/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "02ef07f993bb155d842c2e4f729825ddfd6a359ce7bf423829679443cd652ce4"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/argus/"
  end

  test do
    assert_match "usage: argus install", shell_output("#{bin}/argus 2>&1", 1)
  end
end
