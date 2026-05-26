class Argus < Formula
  desc "Security gateway for AI agent and MCP package installation"
  homepage "https://github.com/argusgate/argus"
  url "https://github.com/argusgate/argus/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "bd0603904d2ccabbaa42d7124a43dabc26aa3e3ab58d9429fcbdef035efd6eea"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/argus/"
  end

  test do
    assert_match "usage: argus install", shell_output("#{bin}/argus 2>&1", 1)
  end
end
