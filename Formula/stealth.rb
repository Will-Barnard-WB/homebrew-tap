# Generated with JReleaser 1.26.0 at 2026-09-29T17:04:12.933959187Z

class Stealth < Formula
  desc "Autonomous maintainer that finds and clears tech and security debt"
  homepage "https://github.com/Will-Barnard-WB/stealth"
  url "https://github.com/Will-Barnard-WB/stealth/releases/download/v0.1.0-rc.1/stealth-0.1.0-rc.1.zip"
  version "0.1.0-rc.1"
  sha256 "608393ea071bd10318491020afbd952336c323544b6eac8a0f7cf441941ab708"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    # openjdk@21 is keg-only, so point the launcher at it instead of relying on java being on PATH
    (bin/"stealth").write_env_script libexec/"bin/stealth",
      Language::Java.overridable_java_home_env("21")
  end

  test do
    output = shell_output("#{bin}/stealth --version")
    assert_match "0.1.0-rc.1", output
  end
end
