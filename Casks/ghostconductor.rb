cask "ghostconductor" do
  version "v0.1.0-dev"
  on_macos do
    on_arm do
      sha256 "51daabab38b5397bec4b73d0f6851f196238c6809ee221104b4cbe5873e2d67d"
      url "file:///Users/kennychen/Projects/GhostConductor/ghostconductor/dist/ghostconductor-v0.1.0-dev-darwin-arm64.tar.gz"
    end
    on_intel do
      sha256 "e0a80d8f845eb5a2c85a2f55947610d8cd9af002e76da4daefcedf5d22f88c8c"
      url "file:///Users/kennychen/Projects/GhostConductor/ghostconductor/dist/ghostconductor-v0.1.0-dev-darwin-amd64.tar.gz"
    end
  end
  name "ghostconductor"
  desc "AI agent orchestration platform"
  homepage "https://ghostconductor.io"
  binary "ghostconductor"
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/ghostconductor"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/etc/prompts/intent"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/etc/context"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/jobs"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/repos"]
    system_command "/bin/mkdir", args: ["-p", "#{Dir.home}/ghostconductor/shared"]
    system_command "/usr/bin/touch", args: ["#{Dir.home}/ghostconductor/etc/CONTEXT.md"]
  end
  uninstall_postflight do
    system_command "/bin/rm", args: ["-rf", "#{Dir.home}/ghostconductor"]
    system_command "/bin/rm", args: ["-rf", "#{Dir.home}/.ghostconductor"]
  end
end
