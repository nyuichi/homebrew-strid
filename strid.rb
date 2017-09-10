class Strid < Formula
  desc "A string diagram generator"
  homepage "http://smimram.github.io/strid/"
  head "https://github.com/smimram/strid.git", :revision => "0178405f802af91646094ddf44d6017595f2c7ac"

  depends_on "ocaml" => [:build, "with-x11"]

  def install
    ENV.deparallelize

    inreplace "Makefile", /\/usr\/local/, ""

    system "make", "DESTDIR=#{prefix}"
    system "make", "DESTDIR=#{prefix}", "install"
  end

  test do
    (testpath/"sample.strid").write("matrix{\n}")
    system bin/"strid", testpath/"sample.strid"
  end
end
