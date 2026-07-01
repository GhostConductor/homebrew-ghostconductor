cask "ghostconductor" do
  version "v0.1.0-dev"
  on_macos do
    on_arm do
      sha256 "eff6664c48368366626f656e86e932cf904b239db36087b64fbec48e47992d87"
      url "file:///Users/kennychen/Projects/GhostConductor/ghostconductor/dist/ghostconductor-v0.1.0-dev-darwin-arm64.tar.gz"
    end
    on_intel do
      sha256 "c61fc72a159a86c4256f1221c3e9f61796b280d026e9a91b1941b860a68f1ae7"
      url "file:///Users/kennychen/Projects/GhostConductor/ghostconductor/dist/ghostconductor-v0.1.0-dev-darwin-amd64.tar.gz"
    end
  end
  name "ghostconductor"
  desc "AI agent orchestration platform"
  homepage "https://ghostconductor.io"
  binary "ghostconductor"
  postflight do
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/etc"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/jobs"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/repos"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/shared"]
  end
  uninstall_postflight do
    system_command "/bin/rm", args: ["-rf", "#{Dir.home}/ghostconductor"]
    system_command "/bin/rm", args: ["-rf", "#{Dir.home}/.ghostconductor"]
  end
end
