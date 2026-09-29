# Generated with JReleaser 1.26.0 at 2026-09-29T21:00:55.870060327Z

class Stealth < Formula
  desc "Autonomous maintainer that finds and clears tech and security debt"
  homepage "https://github.com/Will-Barnard-WB/stealth"
  url "https://github.com/Will-Barnard-WB/stealth/releases/download/v0.1.0-rc.2/stealth-0.1.0-rc.2.zip"
  version "0.1.0-rc.2"
  sha256 "76070cdf418b0abff3abe8d5a467a8ba7e917bf72b86fa3f6418b23cd8f059e4"
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
    assert_match "0.1.0-rc.2", output
  end
end
