class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.0/impz-darwin-arm64"
      sha256 "4ece1be7f44eb9378d7f7323fbfe069922df665367def932a36855eea2a42d5c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.0/impz-darwin-x64"
      sha256 "5b561e97f2fa9647f64c8b7adbc75f129b6b76e52954fd959b0ada3a2326a75e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.0/impz-linux-arm64"
      sha256 "bc07a94e20183246232a1919b73e91f042d887d2bba14cc64e502b3f32c65301"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.0/impz-linux-x64"
      sha256 "5eda08767d64058c3da104d47bbcc00473eccfd14567b063ac226bafbb9b00c6"
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
