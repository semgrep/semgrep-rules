# ===== 1. Official image tags =====

# ruleid: php-version-usage
FROM php:8.2-fpm AS t1-bad
# ok: php-version-usage
FROM php:8.2.35-fpm AS t1-good

# ruleid: php-version-usage
FROM php:7.4-cli AS t1-old

# ruleid: php-version-usage
FROM php:8 AS t1-major-only
# ok: php-version-usage
# FROM php:9 AS t1-php9

# ruleid: php-version-usage
FROM php:8.3.35-alpine3.20 AS t1-last-vulnerable
# ok: php-version-usage
FROM php:8.3.36-alpine3.20 AS t1-fixed

# ruleid: php-version-usage
FROM --platform=linux/amd64 php:8.1.30 AS t1-platform
# ruleid: php-version-usage
FROM --platform=$BUILDPLATFORM php:8.2 AS t1-platform-var
# ok: php-version-usage
FROM --platform=$BUILDPLATFORM node:20 AS t1-platform-node
