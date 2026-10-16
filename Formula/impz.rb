class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.4/impz-darwin-arm64"
      sha256 "e75edc981a7bc3d795e809dd44a33f1ee404799549850f4f340c738985c8dea9"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.4/impz-darwin-x64"
      sha256 "450a23d57923bab4d18f5d0994ef206373fc1c93d5aa39ef880ead3df51eaffd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.4/impz-linux-arm64"
      sha256 "48a51eb620c4e7ff7ef9791d334ce64e96600887d57be583d621fa6630571008"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.4/impz-linux-x64"
      sha256 "27d68fddd38aad5b26feae57965cbc9b4bd7128b65a9187742d12970c0802b87"
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
