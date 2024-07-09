class LeetcodeFeedback < Formula
  desc "A script to fetch the likes, dislikes, and dislike percentage of a LeetCode problem"
  homepage "https://github.com/IamSinha27/homebrew-leetcode-dislikes"
  url "https://github.com/yourusername/homebrew-leetcode-feedback/archive/v1.0.tar.gz"
  sha256 "your_tarball_sha256"
  version "1.0"

  def install
    bin.install "leetcode-dislikes.sh" => "leetcode-dislikes"
  end

  test do
    system "#{bin}/leetcode-dislikes", "--help"
  end
end
