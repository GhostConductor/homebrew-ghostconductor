class Ghostconductor < Formula
  desc "Run autonomous AI software engineering agents on your local machine"
  homepage "https://github.com/GhostConductor/ghostconductor"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GhostConductor/ghostconductor/releases/download/v0.1.0/ghostconductor-v0.1.0-darwin-arm64.tar.gz"
      sha256 "e653ab96c1ea7c43dfdd14705d8a626b54f3f10d6a0147cfafdc3536eca7b5c4"
    else
      url "https://github.com/GhostConductor/ghostconductor/releases/download/v0.1.0/ghostconductor-v0.1.0-darwin-amd64.tar.gz"
      sha256 "544194b3052afcd9da0862db63040bba039fc44990b42ec3b9fee7c57f96f207"
    end
  end

  def install
    bin.install "ghostconductor-darwin-arm64" => "ghostconductor" if Hardware::CPU.arm?
    bin.install "ghostconductor-darwin-amd64" => "ghostconductor" if Hardware::CPU.intel?
  end

  test do
    system "#{bin}/ghostconductor", "--help"
  end
end
