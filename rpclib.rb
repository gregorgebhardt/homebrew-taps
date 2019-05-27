class Rpclib < Formula
  desc "Modern msgpack-rpc for c++"
  homepage "http://rpclib.net"
  url "https://github.com/rpclib/rpclib/archive/v2.2.1.tar.gz"
  sha256 "ceef2c521a1712035bc64d1bd5e3b2c7de16a1d856cbbeadd000ae318c96463f"
  head "https://github.com/rpclib/rpclib.git"

  option "with-unit-tests", "Build unit tests."
  option "with-generate-comp-db", "Generate compilation database. Useful for YCM."
  option "with-examples", "Build examples."
  option "with-logging", "Allow logging in the library for debug purposes."
  option "with-coverage", "Generate coverage information."
  option "with-msvc-static-runtime", "MSVC only: build with /MT instead of /MD."

  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    args << "-DRPCLIB_BUILD_TESTS=ON" if build.with? "unit-tests"
    args << "-DRPCLIB_GENERATE_COMPDB=ON" if build.with? "generate-comp-db"
    args << "-DRPCLIB_BUILD_EXAMPLES=ON" if build.with? "examples"
    args << "-DRPCLIB_ENABLE_LOGGING=ON" if build.with? "logging"
    args << "-DRPCLIB_ENABLE_COVERAGE=ON" if build.with? "coverage"
    args << "-DRPCLIB_MSVC_STATIC_RUNTIME=ON" if build.with? "msvc-static-runtime"
    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    system "false"
  end
end
