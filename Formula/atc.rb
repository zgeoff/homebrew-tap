class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.3/atc-darwin-arm64"
      sha256 "f3e9266aa64ee9ae4d73bbc6efc3f4f39cd0bcc624336782a5aa726dc0109d8c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.3/atc-darwin-x64"
      sha256 "928dacdd46a7f652da5415714621c4197fe880ef6ade2b720a50057d6a970268"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.3/atc-linux-arm64"
      sha256 "9d051b5a290c75a8ef7cda87e501cc95db27dff3dadc84840481bba025339a1c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.3/atc-linux-x64"
      sha256 "7f43e40ed428858a5d918ab7d6cf98f971a0e876e99660884930767702fff2e2"
    end
  end

  def install
    binary = Dir["atc-*"].first
    bin.install binary => "atc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atc --version")
  end
end
