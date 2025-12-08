class Gg2 < Formula
  desc "CLI tool for creating, committing, and generally managing your git branches"
  homepage "https://github.com/peterbe/gg2"
  version "0.0.13"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.13/gg-darwin-arm64"
      sha256 "c53bce15df833fa1815b5d85bd6a5b6584ce1f4caecf151b5973b74d64e1c38e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.13/gg-darwin-x64"
      sha256 "2380e15da47ba5f4159b6706272e821b9d84b67b1780b38ccdc0480646af8d08"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.13/gg-linux-arm64"
      sha256 "1c141b63bd190a1366205a7b71b3e32fe76cdbb2229e95b328bc587eb410e536"
    end
    if Hardware::CPU.intel?
      url "https://github.com/peterbe/gg2/releases/download/v0.0.13/gg-linux-x64"
      sha256 "3db6b57fac0f4c0af15f13f51dc5127663a6fd8cb12e642900f59d9f82ac86b7"
    end
  end
  license "MIT"

  # BINARY_ALIASES = {
  #   "aarch64-apple-darwin":      {},
  #   "aarch64-unknown-linux-gnu": {},
  #   "x86_64-apple-darwin":       {},
  #   "x86_64-pc-windows-gnu":     {},
  #   "x86_64-unknown-linux-gnu":  {},
  # }.freeze

  # def target_triple
  #   cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  #   os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

  #   "#{cpu}-#{os}"
  # end

  # def install_binary_aliases!
  #   BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
  #     dests.each do |dest|
  #       bin.install_symlink bin/source.to_s => dest
  #     end
  #   end
  # end

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
