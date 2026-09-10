class Slooks < Formula
  desc "Slack hooks daemon: run shell commands on Slack events, as you"
  homepage "https://github.com/zgeoff/slooks"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.0/slooks-darwin-arm64"
      sha256 "041e7eff2435598a3853c8ff7e0499eda7e5fe6f536bbda32cfd32428d42f444"
    end
    on_intel do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.0/slooks-darwin-x64"
      sha256 "335d9534f625158ba3500e59a29f7e695717016529526e7cff3565885723b58d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.0/slooks-linux-arm64"
      sha256 "310a80196bf8b973f61ff382dedf60674cc741c6dbe6d08356cba3b50b69e041"
    end
    on_intel do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.0/slooks-linux-x64"
      sha256 "117184a4dbcb00b811b3f148a1e158a6565c365810008997a296bfa38a4a06f6"
    end
  end

  def install
    binary = Dir["slooks-*"].first
    bin.install binary => "slooks"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slooks --version")
  end
end
