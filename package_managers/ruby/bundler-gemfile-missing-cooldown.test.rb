# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org"

# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 6

# ok: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 0

# ok: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 7

# ok: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 30

# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org", group: :development

# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org" do
  gem "rails"
end

# Block form — multiple gems, no cooldown
# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org" do
  gem "rails"
  gem "rack"
  gem "puma"
end

# Block form — private registry, no cooldown
# ruleid: bundler-gemfile-missing-cooldown
source "https://gems.internal.company.com" do
  gem "internal-lib"
end

# Block form — cooldown too low
# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 3 do
  gem "rails"
end

# Block form — safe cooldown
# ok: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 7 do
  gem "rails"
end

# Block form — explicit bypass (internal registry)
# ok: bundler-gemfile-missing-cooldown
source "https://gems.internal.company.com", cooldown: 0 do
  gem "internal-lib"
end

# ok: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 7
# ruleid: bundler-gemfile-missing-cooldown
source "https://gems.company.com"

# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 1

# ruleid: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: 3

# If no source, cannot cooldown the package
# ok: bundler-gemfile-missing-cooldown
gem "private-gem", source: "https://gems.internal.company.com"

# ok: bundler-gemfile-missing-cooldown
source MY_GEM_SERVER_URL

# ok: bundler-gemfile-missing-cooldown
source "https://rubygems.org", cooldown: ENV["GEM_COOLDOWN"].to_i
