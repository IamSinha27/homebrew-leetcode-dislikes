class LeetcodeDislikes < Formula
  desc "A script to fetch the likes, dislikes, and dislike percentage of a LeetCode problem"
  homepage "https://github.com/IamSinha27/homebrew-leetcode-dislikes"
  url "https://github.com/IamSinha27/homebrew-leetcode-dislikes/archive/v1.3.tar.gz"
  sha256 "de63e1966a82cfb3d3a37443f5eedc5290db2e92b6b32c5cd4e726cf06f897bb"
  version "1.3"

  def install
    bin.install "leetcode-dislikes.sh" => "leetcode-dislikes"
  end

  test do
    system "#{bin}/leetcode-dislikes", "--help"
  end
end
