# Homebrew Formula for bgs
# bgs = bilibili goods

class Bgs < Formula
  desc "Bilibili Goods CLI - batch publish/buy items on Bilibili Mall"
  homepage "https://github.com/oreoft/bg-cmd"
  url "https://github.com/oreoft/bg-cmd/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cc4fec88224efd4425ae4b8e90753fabd9f733ca966d1e8879f33be380b35ef2"
  license "MIT"
  version "1.0.0"

  depends_on "jq"
  depends_on "qrencode"

  def install
    bin.install "bin/bgs"
    libexec.install Dir["libexec/*"]
    
    # Update libexec path in main script
    inreplace bin/"bgs",
      'LIBEXEC_DIR="${SCRIPT_DIR}/../libexec"',
      "LIBEXEC_DIR=\"#{libexec}\""
  end

  def caveats
    <<~EOS
      bgs (bilibili goods) has been installed!

      Quick start:
        1. Login: bgs auth login
        2. Set price: bgs config publish.price 200
        3. Publish: bgs publish
        4. Buy: bgs buy

      For help: bgs help
    EOS
  end

  test do
    assert_match "bgs version", shell_output("#{bin}/bgs version")
  end
end
