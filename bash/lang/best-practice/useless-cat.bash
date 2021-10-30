# ok:useless-cat
a b

# ruleid:useless-cat
cat | a b

# ruleid:useless-cat
cat | a b | c d

# ok:useless-cat
cat file1 file2 | a b

# ok:useless-cat
cat $files | a b

# ruleid:useless-cat
cat file | a b

# ruleid:useless-cat
cat "$file" | a b

# ruleid:useless-cat
a b | cat > file

# ruleid:useless-cat
a b | c d | cat > file

# ruleid:useless-cat
a b | cat | c d

# ruleid:useless-cat
a b | c d | cat | e f | g h

# ruleid:useless-cat
while true; do
  a b
done | cat

# ruleid:useless-cat
cat | while true; do
  a b
done
