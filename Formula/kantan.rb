class Kantan < Formula
  desc "A beautifully simple status bar for macOS"
  homepage "https://github.com/cmacrae/kantan"
  license "MIT"
  version "0.1.0"
  url "https://github.com/cmacrae/kantan/releases/download/v0.1.0/kantan-0.1.0-aarch64-darwin.tar.gz"
  sha256 "5963472196928e68a487d23f85b19cc3ecffdefb7515db36ea408e079f5c04de"

  bottle do
    root_url "https://github.com/cmacrae/kantan/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e09679e4e0740de7b3ed5a2c41283289cdb9d0caf1d36b68de277d402efed536"
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia
  conflicts_with "kantan-without-plugins", because: "both install a kantan binary"

  def install
    prefix.install "bin", "share"
  end

  service do
    run [opt_bin/"kantan"]
    environment_variables PATH: std_service_path_env
    log_path var/"log/kantan.log"
    error_log_path var/"log/kantan.log"
    keep_alive true
    process_type :interactive
  end
end
