class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.3/impz-darwin-arm64"
      sha256 "1672b903de00ace0e8d0cb02d8ce78183b2c8a9b6d08c07703d947718db5fc85"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.3/impz-darwin-x64"
      sha256 "56385d1bd750e111a5db0a2520e96b23f2f246d4b937f51393be74c3a81e1ed2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.3/impz-linux-arm64"
      sha256 "26b96ac5851b4d9fc82f5699a129b011ad30abac7411e7f46e82fa7ec70c5a13"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.3/impz-linux-x64"
      sha256 "2d2875dbeec062763e922c3ba93716aaba98c2d1bae338718393f89385f3edca"
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
