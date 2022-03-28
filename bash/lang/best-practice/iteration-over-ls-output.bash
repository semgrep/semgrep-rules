# ok:iteration-over-ls-output
for file in dir/*; do
  echo "Found a file: $file"
done

# ruleid:iteration-over-ls-output
for file in $(ls dir); do echo "Found a file: $file"; done

# ruleid:iteration-over-ls-output
for file in $(ls dir)
do
  echo "Found a file: $file"
done
