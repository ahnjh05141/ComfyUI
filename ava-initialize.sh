#!/usr/bin/env bash
set -euo pipefail

chmod +x download.sh

# 1. 모델 다운로드
echo "[STEP 1] Download models..."
bash download.sh

# 2. Python requirements 설치
echo "[STEP 2] Install requirements..."
pip install --upgrade pip
pip install -r requirements.txt