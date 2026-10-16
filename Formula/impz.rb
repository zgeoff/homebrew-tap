class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.5/impz-darwin-arm64"
      sha256 "6ffe34cd42011a7a8aaa6208f184d666349481ee2ae89c2d94d23837671b61e9"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.5/impz-darwin-x64"
      sha256 "ef185bf7c9dcc76e1bb345497ad53d981e8b9342046ba8de5abac63255657a54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.5/impz-linux-arm64"
      sha256 "08524c23ecd263c4bc059725f902f990b0c519231db439257f818e48c75e7725"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.5/impz-linux-x64"
      sha256 "4d67593dc3adb6984f7ea6af888770bbebf9096239e98870a1bbed25243922b6"
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
