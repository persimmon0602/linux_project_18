#!/bin/bash
DEST_DIR="Sources"
if [ ! -d "$DEST_DIR" ]; then mkdir -p "$DEST_DIR"; fi
find . -maxdepth 1 -type f \
    \( -name "*.c" -o -name "*.py" -o -name "*.java" -o -name "*.sh" \) \
    ! -name "main.sh" ! -name "image_mover.sh" ! -name "code_archivist.sh" ! -name "cleaner.sh" ! -name "report.sh" \
    -exec mv {} "$DEST_DIR" \; 2>/dev/null
echo "소스코드 정리 완료"
