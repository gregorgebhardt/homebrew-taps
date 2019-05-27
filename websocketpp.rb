require 'formula'

class Websocketpp < Formula
  head 'git://github.com/zaphoyd/websocketpp'

  depends_on 'cmake' => :build
  
  def install
    system "cmake . #{std_cmake_args.join(" ")}"
    system "make install"
  end
end
