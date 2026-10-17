class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.1/impz-darwin-arm64"
      sha256 "fbca859663943c170b035d9fa0db36ce026c83c53e8f22257bb8d76278e31200"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.1/impz-darwin-x64"
      sha256 "dd3f533353417675344bb3fddea9ed214d478f6286c665cdbf13a0a509c964a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.1/impz-linux-arm64"
      sha256 "978039a548e12a8cc66b147152a6668db271edc9c74f6435dcd5f7ba96e8e513"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.1/impz-linux-x64"
      sha256 "a23824f02b08ee46eb453f129e1dc65a756ff4986cc31334a58596a4ea1743d0"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["impz-*"].first
    chmod 0755, binary
    bin.install binary => "impz"
    generate_completions_from_executable(bin/"impz", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/impz --version").strip
  end
end
