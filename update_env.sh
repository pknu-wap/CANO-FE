#!/bin/sh

# .env 파일의 위치를 지정합니다.
ENV_FILE="../assets/config/.env"  # 스크립트 위치에 따라 조정 필요

# xcconfig 파일의 위치를 지정합니다.
DEBUG_XCCONFIG="ios/Flutter/Debug.xcconfig"
RELEASE_XCCONFIG="ios/Flutter/Release.xcconfig"

# .env 파일이 존재하는지 확인합니다.
if [ -f "$ENV_FILE" ]; then
  # .env 파일의 내용을 읽어옵니다.
  export $(grep -v '^#' $ENV_FILE | xargs)
else
  echo ".env 파일을 찾을 수 없습니다."
  exit 1
fi

# KAKAO_NATIVE_APP_KEY가 설정되어 있는지 확인합니다.
if [ -z "$KAKAO_NATIVE_APP_KEY" ]; then
  echo "KAKAO_NATIVE_APP_KEY가 .env 파일에 설정되어 있지 않습니다."
  exit 1
fi

# 기존 xcconfig 파일을 백업하거나 초기화
echo "KAKAO_NATIVE_APP_KEY = $KAKAO_NATIVE_APP_KEY" > "$DEBUG_XCCONFIG"
echo "KAKAO_NATIVE_APP_KEY = $KAKAO_NATIVE_APP_KEY" > "$RELEASE_XCCONFIG"

echo "KAKAO_NATIVE_APP_KEY가 xcconfig 파일에 성공적으로 주입되었습니다."
