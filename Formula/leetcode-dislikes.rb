class LeetcodeDislikes < Formula
  desc "A script to fetch the likes, dislikes, and dislike percentage of a LeetCode problem"
  homepage "https://github.com/IamSinha27/homebrew-leetcode-dislikes"
  url "https://github.com/IamSinha27/homebrew-leetcode-dislikes/archive/v1.2.tar.gz"
  sha256 "3025f1421261bdbf2a8e43abcbc9322567218d5f1a48a5d7e8210f1d199c6e65"
  version "1.2"

  def install
    bin.install "leetcode-dislikes.sh" => "leetcode-dislikes"
  end

  test do
    system "#{bin}/leetcode-dislikes", "--help"
  end
end
