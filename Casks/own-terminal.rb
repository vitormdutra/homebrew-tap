cask "own-terminal" do
  version "1.5.2"
  sha256 "e44a23814373ddc942e92ceea6a02b5ef3f2414df04bd96cd9b11ed65d733e2c"

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
