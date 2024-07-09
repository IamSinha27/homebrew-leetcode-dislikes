class LeetcodeDislikes < Formula
  desc "A script to fetch the likes, dislikes, and dislike percentage of a LeetCode problem"
  homepage "https://github.com/IamSinha27/homebrew-leetcode-dislikes"
  url "https://github.com/IamSinha27/homebrew-leetcode-dislikes/archive/v1.1.tar.gz"
  sha256 "18e1e924f8010f4c6b46f4b626fc4b16abaa86c65d83d954832d8f5bc1e960be"
  version "1.1"

  def install
    bin.install "leetcode-dislikes.sh" => "leetcode-dislikes"
  end

  test do
    system "#{bin}/leetcode-dislikes", "--help"
  end
end
