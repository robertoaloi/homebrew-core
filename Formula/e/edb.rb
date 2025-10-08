class Edb < Formula
  desc "Next-generation debugger for Erlang"
  homepage "https://hexdocs.pm/edb"
  url "https://github.com/WhatsApp/edb/archive/refs/tags/0.5.0.tar.gz"
  sha256 "284300567629299c1fc0da1f260b31ca4eb531c1e73c904a48583262901065c1"
  license "Apache-2.0"

  depends_on "rebar3" => :build
  depends_on "erlang" # Requires Erlang/OTP >= 28

  def install
    system "rebar3", "escriptize"
    bin.install "_build/default/bin/edb"
  end

  test do
    assert_path_exists "bin/edb"
    assert_match "Usage", shell_output("bin/edb", 1)
  end
end
