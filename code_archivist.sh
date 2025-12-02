#!/bin/bash

# ==========================================
# 기능 2: Code Archivist (소스코드 분류)
# ==========================================

DEST_DIR="Sources"

echo "[Code Archivist] 소스코드 파일을 정리합니다..."

# 1. 목적지 디렉토리가 없으면 생성
if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    echo " -> '$DEST_DIR' 디렉토리를 생성했습니다."
fi

# 2. 소스코드 이동 로직 (시스템 파일 제외)
find . -maxdepth 1 -type f \
    \( -name "*.c" -o -name "*.py" -o -name "*.java" -o -name "*.sh" \) \
    ! -name "main.sh" \
    ! -name "image_mover.sh" \
    ! -name "code_archivist.sh" \
    ! -name "cleaner.sh" \
    ! -name "report.sh" \
    -exec mv {} "$DEST_DIR" \; 2>/dev/null

echo " -> 소스코드 이동이 완료되었습니다."
echo " -> (시스템 쉘 스크립트 파일은 안전하게 유지됩니다.)"
echo ""
