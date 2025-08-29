#!/usr/bin/env bash
set -euo pipefail

# ComfyUI 작업 디렉토리로 이동
cd /workspace/ComfyUI || exit 1

# input/output 폴더 초기화
rm -rf /workspace/ComfyUI/output/* /workspace/ComfyUI/input/* || true
mkdir -p /workspace/ComfyUI/output /workspace/ComfyUI/input

# main.py 실행 (포트 8080으로 listen)
exec python main.py \
  --listen 0.0.0.0 \
  --port 8080 \
  --input-directory /workspace/ComfyUI/input \
  --output-directory /workspace/ComfyUI/output