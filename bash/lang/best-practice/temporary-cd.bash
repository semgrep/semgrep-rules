# ok:temporary-cd
(
  cd dir
  echo hello > file
)

# ruleid:temporary-cd
cd dir
echo hello > file
cd ..

# ok:temporary-cd
cd dir
thing=1
cd ..
echo "$thing"
