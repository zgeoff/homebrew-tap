class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.1/impz-darwin-arm64"
      sha256 "fed13932dd6663a84df7653ed979126ef8f40a8a4666f32018e80f62035b41f9"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.1/impz-darwin-x64"
      sha256 "7c29563c69cb761353da8a5b5b4f79db5f773d1bd7ea27a6f8e060b65091e3d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.1/impz-linux-arm64"
      sha256 "ce2e3c6150c4ecb58a6c8df5b476859a50388666c920796a543e27a9627056fd"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.1/impz-linux-x64"
      sha256 "2d080074d797ae39c322a8352189be27d72a9563a19a3ab5d4a1a7bf9f5c50a1"
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
