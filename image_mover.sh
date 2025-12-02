#!/bin/bash

# ==========================================
# 기능 1: Image Mover (미디어 파일 분류)
# ==========================================

DEST_DIR="Images"

echo "[Image Mover] 이미지 파일을 정리합니다..."

# 1. 목적지 디렉토리가 없으면 생성
if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    echo " -> '$DEST_DIR' 디렉토리를 생성했습니다."
fi

# 2. 이미지 파일 이동 로직
mv *.png *.jpg *.gif "$DEST_DIR" 2>/dev/null

# 3. 결과 확인
COUNT=$(ls "$DEST_DIR" 2>/dev/null | wc -l)

echo " -> 정리가 완료되었습니다."
echo " -> 현재 '$DEST_DIR' 폴더 내 파일 개수: $COUNT 개"
echo ""
