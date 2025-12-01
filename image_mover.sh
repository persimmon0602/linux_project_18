#!/bin/bash
DEST_DIR="Images"
if [ ! -d "$DEST_DIR" ]; then mkdir -p "$DEST_DIR"; fi
mv *.png *.jpg *.gif "$DEST_DIR" 2>/dev/null
echo "이미지 정리 완료"
