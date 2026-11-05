cask "own-terminal" do
  version "1.5.3"
  sha256 "48da02ee379b50becf6ac2e6366e987910adee23e02292ce1d2346ae3b42154a"

  url "https://github.com/vitormdutra/own-terminal/releases/download/v#{version}/OwnTerminal-macos-apple-silicon.zip"
  name "own-terminal"
  desc "Clean, fast, lightweight terminal emulator with tabs, splits and search"
  homepage "https://github.com/vitormdutra/own-terminal"

  depends_on arch: :arm64

  app "OwnTerminal.app"

  # The app is not notarized; without this Gatekeeper refuses to open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/OwnTerminal.app"]
  end

  zap trash: "~/.config/own-terminal"
end
