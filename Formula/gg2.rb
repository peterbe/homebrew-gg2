# Notes-to-self
# Inspirations taken from
# https://github.com/Homebrew/homebrew-cask/blob/main/Casks/c/claude-code.rb
# https://github.com/sinelaw/homebrew-fresh/blob/main/Formula/fresh-editor.rb
# https://github.com/searlsco/homebrew-tap/blob/main/Formula/imsg.rb
# https://github.com/searlsco/homebrew-tap/blob/main/Formula/autochapter.rb

class Gg2 < Formula
  desc "CLI tool for creating, committing, and generally managing your git branches"
  homepage "https://github.com/peterbe/gg2"
  version "0.0.15"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.15/gg-darwin-arm64"
      sha256 "28336a20a28f85ae3dc9bddea751e05ddc31a23f3b1a64037d02a00b6c874560"
    end
    if Hardware::CPU.intel?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.15/gg-darwin-x64"
      sha256 "3da4917da86df34aa4c65ff0a9f2a2e8a28f14eda52e7e523e01abe5c9b6092c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.15/gg-linux-arm64"
      sha256 "348791c1916ee825e843232ff5391142d6687e203188e07b677780708aec4e04"
    end
    if Hardware::CPU.intel?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.15/gg-linux-x64"
      sha256 "b78d9dfbc08072b29d7deae1b8576c362d27640688a9fa33dd49725bed846e60"
    end
  end
  license "MIT"

  # TODO


  def install
    bin.install "gg-darwin-arm64" => "gg2" if OS.mac? && Hardware::CPU.arm?
    bin.install "gg-darwin-x64" => "gg2" if OS.mac? && Hardware::CPU.intel?
    bin.install "gg-linux-arm64" => "gg2" if OS.linux? && Hardware::CPU.arm?
    bin.install "gg-linux-x64" => "gg2" if OS.linux? && Hardware::CPU.intel?

    # install_binary_aliases!

    # # Homebrew will automatically install these, so we don't need to do that
    # doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    # leftover_contents = Dir["*"] - doc_files

    # # Install any leftover files in pkgshare; these are probably config or
    # # sample files.
    # pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  test do
    system "#{bin}/gg2", "--version"
  end
end
