class ErlangLanguagePlatform < Formula
  desc "Erlang Language Platform. LSP server and CLI."
  homepage "https://whatsapp.github.io/erlang-language-platform/"
  url "https://github.com/WhatsApp/erlang-language-platform/archive/refs/tags/2025-09-11.tar.gz"
  sha256 "7f0e9d8fb34258ffc9689a784eadbcdaa1ded6f6d91bee6689074de08b3f5bc8"
  license "Apache-2.0"

  depends_on "erlang"
  depends_on "rust" => :build
  # TODO: rebar3
  # TODO: eqwalizer

  def install
    system "cargo", "build", "--release", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elp --version")
  end
end
