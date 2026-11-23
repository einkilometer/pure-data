#!/bin/bash
# pd2json.sh - Convert Pd patches to JSON with online source references
base_url="https://github.com/einkilometer/pure-data/tree/main/doc"

find ./doc -name "*.pd" -print0 | while IFS= read -r -d '' file; do
    echo "=== $file ==="
    name_base="${file%.pd}"

    # Pfad relativ zu ./doc/ für URL-Konstruktion
    rel_path="${file#./doc/}"          # z.B. 2.control.examples/01.basics.pd
    rel_base="${rel_path%.pd}"         # z.B. 2.control.examples/01.basics

    # Objektanzahl zuverlässig über JSON ermitteln
    objects=$(~/.cargo/bin/pdtk parse "$file" --json | jq '.objects | length')

    # JSON-Array aufbauen: erstes Element = Metadaten, dann pro Objekt ein Eintrag
    {
        printf '{"online_patch":%s,"source_file":%s,"online_pdf":%s,"objects":[' \
            "$(jq -Rn --arg u "$base_url/$rel_path#L1" '$u')" \
            "$(jq -Rn --arg f "$base_url/$rel_base.txt" '$f')" \
            "$(jq -Rn --arg u "$base_url/$rel_base.pdf" '$u')"

        first=1
        for i in $(seq 0 $((objects - 1))); do
            [ $first -eq 0 ] && printf ','
            first=0
            ~/.cargo/bin/pdtk connections "$file" --index "$i" --json
        done
        printf ']}'
    } > "$name_base.json"

    echo "  -> $objects Objekte, geschrieben nach $name_base.json"
done
