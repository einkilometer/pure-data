for f in doc/1.manual/*.htm; do
  pandoc "$f" -f html -t gfm --wrap=none \
    -o "doc/1.manual/$(basename "${f%.*}").md"
done
for f in doc/8.topics/*.htm; do
  pandoc "$f" -f html -t gfm --wrap=none \
    -o "doc/8.topics/$(basename "${f%.*}").md"
done
