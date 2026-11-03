class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.0/impz-darwin-arm64"
      sha256 "c8c33a8e4ba64fdc9b24ac3ef4f8b84e3d564afd4758f0317988e1ff59acccab"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.0/impz-darwin-x64"
      sha256 "2e42bab1a2f489a8197f7f3d8625b7443d5c32851f4e1d33696edcc5269d2bb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.0/impz-linux-arm64"
      sha256 "082a2e59101a16f16b5367d9792dc3d4f47d79d03378e098d9757911d834a0de"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.0/impz-linux-x64"
      sha256 "ceed7d47db1519868c82c48dbfd5d969ca6218347473993422587d16d38d7eeb"
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
