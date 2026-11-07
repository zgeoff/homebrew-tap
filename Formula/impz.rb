class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.1/impz-darwin-arm64"
      sha256 "44a7f7b121b7039c8c098db989566914de016e82e2564b3021694e9314acee67"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.1/impz-darwin-x64"
      sha256 "263749d68d2069442d04fd96a49b29afdf6a9ef86c514240925786d24840a5ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.1/impz-linux-arm64"
      sha256 "5fb1bc3f707cc444c58a7743ba1d0a24b8a5b5a7b93857a5f6f2ea7b1cca3ff8"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.1/impz-linux-x64"
      sha256 "189520c7a545a9de35f2fbdb962e80dd71c43910b4994fd37aa1a9e2187115ba"
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
