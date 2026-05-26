class Argus < Formula
  desc "Security gateway for AI agent and MCP package installation"
  homepage "https://github.com/argusgate/argus"
  url "https://github.com/argusgate/argus/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "c05da5ff8f41d805b5c8068e465187c754072e66353644a6d9100009e3837b3d"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/argus/"
  end

  test do
    assert_match "usage: argus install", shell_output("#{bin}/argus 2>&1", 1)
  end
end
