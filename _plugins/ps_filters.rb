# Jekyll filters for PS gallery
# - strip_problem_prefix: strips "problem(123)" or "problem (123) " from titles
# - strip_leading_number_paren: strips leading "36)" or "200) " (number + parenthesis) from titles
# - leetcode_url_from_page: reads raw .md from page.path, extracts first [Link](https://leetcode.com/...)
module Jekyll
  module PsFilters
    # Strip leading "problem" or "problem(54)" from titles (case-insensitive). Returns a string.
    # Only strips when the title starts with that pattern (after optional leading spaces).
    def strip_problem_prefix(input)
      return "" if input.nil?
      s = input.to_s.dup
      s.sub!(/^\s*problem(\s*\(\s*\d+\s*\))?\s*/i, "")
      s.strip
    end

    # Strip leading "36)" or "200) " (digits + ")" + optional space) from titles.
    def strip_leading_number_paren(input)
      return "" if input.nil?
      s = input.to_s.dup
      s.sub!(/^\s*\d+\)\s*/i, "")
      s.strip
    end

    # Read the page's source file and extract first [Link](URL) LeetCode URL from markdown.
    # Usage: {{ page | leetcode_url_from_page: site }}
    def leetcode_url_from_page(page, site)
      return nil unless page && site
      return nil unless page.respond_to?(:data) && page.data["leetcode"] == true
      base = (site.respond_to?(:source) && site.source) || "."
      base = File.expand_path(base.to_s)
      # Try page.path first, then build from page.url (View로 보이는 그 .md 경로)
      path = (page.respond_to?(:path) && page.path) || (page.respond_to?(:relative_path) && page.relative_path)
      path = path.to_s.strip.sub(%r{\A/}, "")
      if path.empty? && page.respond_to?(:url) && page.url
        path = page.url.to_s.sub(%r{\A/}, "").sub(%r{/\z}, "") + ".md"
      end
      return nil if path.empty?
      full_path = File.expand_path(path, base)
      return nil unless File.file?(full_path)
      raw = File.read(full_path, encoding: "UTF-8")
      # Match first markdown link whose URL is leetcode.com (e.g. [Link : ...](https://leetcode.com/...))
      m = raw.match(/\]\((https:\/\/leetcode\.com[^)]+)\)/)
      return nil unless m
      url = m[1].strip.gsub(/\s+/, "")
      url.start_with?("https://leetcode.com") ? url : nil
    end
  end
end

Liquid::Template.register_filter(Jekyll::PsFilters)
