class Pushtotalk < Formula
  desc "OSX PushToTalk mutes and unmutes the microphone via a keypress"
  homepage "https://github.com/yulrizka/osx-push-to-talk"
  url "https://github.com/yulrizka/osx-push-to-talk/archive/v0.1.5.tar.gz"
  sha256 "dd0c639c1ba131c8b700d7fbf6475ed564be3b849e23990f39309df7b2c7e170"
  license "MIT"

  depends_on xcode: :build

  def install
    xcodebuild "-project", "PushToTalk.xcodeproj",
      "CODE_SIGN_IDENTITY=-", "-configuration", "Release", "SYMROOT=build"
    prefix.install "build/Release/PushToTalk.app"
  end

  def caveats
    installed_path = "#{prefix}/PushToTalk.app"
    <<~EOS
      The application was only built in "#{installed_path}"

      To make it available in the Application folder, create a symlink with:

          ln -s "#{installed_path}" "/Applications/PushToTalk.app"

    EOS
  end

  test do
    assert FileTest.exists?("#{prefix}/PushToTalk.app")
  end
end
