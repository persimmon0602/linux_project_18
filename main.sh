#!/bin/bash

# ==========================================
# CleanDir Main Interface
# 작성자: 박찬웅 (PM)
# ==========================================

# 모든 스크립트에 실행 권한 부여
chmod +x image_mover.sh code_archivist.sh cleaner.sh report.sh 2>/dev/null

while true; do
    # clear # 화면 지우기 (원하면 주석 해제)
    
    echo "=================================================================="
    echo "               CleanDir - 자동 디렉토리 정리기"
    echo "=================================================================="
    echo " 1. Image Mover (미디어 파일 분류)"
    echo " 2. Code Archivist (소스코드 분류)"
    echo " 3. Zero-Byte Cleaner (불용 파일 정리)"
    echo " 4. Directory Status Report (상태 리포트)"
    echo " 5. 종료 (Exit)"
    echo "------------------------------------------------------------------"
    echo -n " 메뉴를 선택하세요 (1-5): "
    
    read choice
    echo "" 

    case $choice in
        1)
            if [ -f "./image_mover.sh" ]; then
                ./image_mover.sh
            else
                echo "오류: image_mover.sh 파일이 없습니다."
            fi
            ;;
        2)
            if [ -f "./code_archivist.sh" ]; then
                ./code_archivist.sh
            else
                echo "오류: code_archivist.sh 파일이 없습니다."
            fi
            ;;
        3)
            if [ -f "./cleaner.sh" ]; then
                ./cleaner.sh
            else
                echo "오류: cleaner.sh 파일이 없습니다."
            fi
            ;;
        4)
            if [ -f "./report.sh" ]; then
                ./report.sh
            else
                echo "오류: report.sh 파일이 없습니다."
            fi
            ;;
        5)
            echo "프로그램을 종료합니다. 수고하셨습니다!"
            exit 0
            ;;
        *)
            echo "잘못된 입력입니다. 1~5 사이의 숫자를 입력해주세요."
            ;;
    esac

    echo ""
    echo -n "메뉴로 돌아가려면 Enter를 누르세요..."
    read
done
