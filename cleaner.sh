#!/bin/bash

echo "=========================================="
echo "   Zero-Byte Cleaner (빈 파일 정리기)"
echo "=========================================="

# 1. 디렉토리에서 크기가 0인 파일 찾기
# find . : 현재 디렉토리(.)에서
# -type f : 파일만 대상 (디렉토리 제외)
# -empty : 크기가 0인 것만
EMPTY_FILES=$(find . -maxdepth 1 -type f -empty)

# 2. 빈 파일이 있는지 확인
if [ -z "$EMPTY_FILES" ]; then
    echo "삭제할 빈 파일이 없습니다."
else
    # 3. 목록 보여주기
    echo "아래 파일들이 삭제됩니다:"
    echo "$EMPTY_FILES"
    echo "------------------------------------------"

    # 4. 삭제 수행 (개수 세기 포함)
    # wc -l : 라인 수 세기 (삭제된 파일 개수 파악용)
    COUNT=$(echo "$EMPTY_FILES" | wc -l)

    # 실제 삭제 명령어 (-delete 옵션 사용)
    find . -maxdepth 1 -type f -empty -delete

    echo "총 $COUNT 개의 빈 파일을 삭제했습니다."
fi