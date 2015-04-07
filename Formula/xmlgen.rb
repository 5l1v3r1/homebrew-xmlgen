class Xmlgen < Formula
  homepage "https://github.com/dutchcoders/xmlgen"
  url "https://github.com/dutchcoders/XMLGen/archive/v1.0.0.tar.gz"
  sha256 "b26195708a7e47670051284b22ff163f1b7badf919b651fadabd450cc71689b6"
  head "https://github.com/dutchcoders/xmlgen.git"

  depends_on "hg" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p "src/github.com/dutchcoders/"
    ln_s buildpath, "src/github.com/dutchcoders/xmlgen"

    system "go", "get", "code.google.com/p/go-charset/charset"
    system "go", "build", "-o", "xmlgen"

    bin.install "xmlgen"
  end

  test do
    system "#{bin}/xmlgen", "brew.sh"
  end
end
