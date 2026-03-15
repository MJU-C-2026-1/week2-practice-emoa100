#!/bin/bash

# 1. 색상 및 환경 설정
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
TARGET_EXE="app.out"

# 2. .c 파일 존재 여부 확인
if ! ls *.c > /dev/null 2>&1; then
    echo -e "${RED}❌ 에러: 컴파일할 .c 파일이 폴더에 없습니다.${NC}"
    exit 1
fi

# 3. 모든 .c 파일 컴파일 (수학 라이브러리 -lm 포함)
echo -e "🔨 모든 C 소스 파일 컴파일 중..."
gcc *.c -o "$TARGET_EXE" -Wall -lm

# 4. 컴파일 성공 여부 확인 및 실행
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ 컴파일 성공! 프로그램을 실행합니다.${NC}"
    echo "------------------------------------------"
    
    # 학생 프로그램 실행 및 종료 코드 저장
    ./"$TARGET_EXE"
    EXIT_CODE=$? 
    
    echo ""
    echo "------------------------------------------"
    
    # 바이너리 삭제 후 학생의 종료 코드 반환
    rm "$TARGET_EXE"
    exit $EXIT_CODE
else
    echo -e "${RED}❌ 컴파일 실패! 오류 메시지를 확인하세요.${NC}"
    exit 1
fi
