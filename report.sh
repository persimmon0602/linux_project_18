#!/bin/bash

# ==========================================
# 🎨 색상 및 스타일 정의 (ANSI Escape Code)
# ==========================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color (초기화)

# ==========================================
# 메인 리포트 로직
# ==========================================

# 1. 헤더 출력
echo -e "${YELLOW}======================================================${NC}"
echo -e "${BOLD}${CYAN}          Directory Status Report           ${NC}"
echo -e "${YELLOW}======================================================${NC}"
echo ""

# 2. 전체 요약 (Total Summary)
# ls -R로 전체를 뒤져서 파일 개수 세기
# grep ^- : 파일 라인만 찾기 (디렉토리 제외)
# wc -l : 개수 세기
TOTAL_FILES=$(ls -lR 2>/dev/null | grep "^-" | wc -l)
TOTAL_DIRS=$(find . -type d | wc -l)

echo -e "${BOLD}[ 전체 요약 ]${NC}"
echo -e "  - 탐색 위치 : ${BLUE}$(pwd)${NC}"
echo -e "  - 총 디렉토리 : ${GREEN}${TOTAL_DIRS}${NC} 개"
echo -e "  - 총 파일 수  : ${GREEN}${TOTAL_FILES}${NC} 개"
echo ""

# 3. 폴더별 상세 현황 (Table View)
echo -e "${BOLD}[ 폴더별 상세 현황 ]${NC}"
echo -e "${YELLOW}------------------------------------------------------${NC}"
# printf를 사용하여 간격 맞추기 (왼쪽 정렬 35칸, 오른쪽 정렬 10칸)
printf "${BOLD}%-35s | %10s${NC}\n" "디렉토리 이름(Path)" "파일 개수"
echo -e "${YELLOW}------------------------------------------------------${NC}"

# find 명령어로 디렉토리를 찾고, while 문으로 하나씩 처리
find . -maxdepth 2 -type d | sort | while read dir; do
    # 각 디렉토리 내부의 파일 개수만 세기 (-maxdepth 1)
    file_count=$(find "$dir" -maxdepth 1 -type f | wc -l)

    # 0개면 빨간색, 1개 이상이면 초록색으로 표시
    if [ "$file_count" -eq 0 ]; then
        COLOR="${RED}"
    else
        COLOR="${GREEN}"
    fi

    # 결과 출력 (printf로 줄맞춤)
    # . (현재 디렉토리)는 보기 좋게 'ROOT'로 표시
    if [ "$dir" == "." ]; then
        display_name="ROOT (./)"
    else
        display_name="$dir"
    fi

    printf "%-35s | ${COLOR}%10s${NC}\n" "$display_name" "$file_count"
done

echo -e "${YELLOW}------------------------------------------------------${NC}"
echo -e "${CYAN}리포트 작성이 완료되었습니다.${NC}"
echo ""