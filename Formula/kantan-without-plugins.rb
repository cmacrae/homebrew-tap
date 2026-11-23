class KantanWithoutPlugins < Formula
  desc "A beautifully simple status bar for macOS (without plugins)"
  homepage "https://github.com/cmacrae/kantan"
  license "MIT"
  version "0.1.0"
  url "https://github.com/cmacrae/kantan/releases/download/v0.1.0/kantan-without-plugins-0.1.0-aarch64-darwin.tar.gz"
  sha256 "a7f6dcf5fc4e5164f3b5354587eb8a73ba220decde80c465d433c652e5b226f7"

  bottle do
    root_url "https://github.com/cmacrae/kantan/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cda322cbf0a62fd0768fbf0157ac0a40205e9d71268986cb991ad8144709a3d9"
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia
  conflicts_with "kantan", because: "both install a kantan binary"

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
