#!/usr/bin/env bash
set -euo pipefail

chmod +x start_comfyui.sh

# 로그 시작
echo "=== $(date) initialize ComfyUI ==="

# 1. 모델 다운로드
echo "[STEP 1] Download models..."
bash /workspace/ComfyUI/models/download.sh

# 2. Python requirements 설치
echo "[STEP 2] Install requirements..."
pip install --upgrade pip
pip install -r /workspace/ComfyUI/requirements.txt

# 3. start_comfyui.sh 크론 등록
echo "[STEP 3] Register start_comfyui.sh into crontab..."
CRON_JOB="@reboot /bin/bash -lc '/workspace/ComfyUI/start-comfyui.sh'"
# 중복 방지: 기존 등록된 동일 라인 제거
( crontab -l 2>/dev/null | grep -v "start-comfyui.sh" ; echo "$CRON_JOB" ) | crontab -

echo "[DONE] Initialization completed. ComfyUI will auto-start on reboot."