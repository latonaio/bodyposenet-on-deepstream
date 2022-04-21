# Self-Documented Makefile
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

docker-build: ## docker image の作成
	docker-compose build

docker-run: ## docker container の立ち上げ
	docker-compose up -d

docker-login: ## カメラからの入力を検証して、出力する
	docker exec -it bodyposenet-camera bash

stream-start: ## ダンス動画の解析を画面に表示
	xhost +
	docker exec -it bodyposenet-camera  mkdir  -p /app/src/deepstream_tao_apps/models/bodypose2d
	docker exec -it bodyposenet-camera  cp /app/mnt/deepstream-bodypose2d-app /app/src/deepstream_tao_apps/apps/tao_others/deepstream-bodypose2d-app/
	docker exec -it bodyposenet-camera  cp /app/mnt/bodyposenet.etlt /app/src/deepstream_tao_apps/models/bodypose2d/model.etlt
	docker exec -it bodyposenet-camera  cp /app/mnt/bodyposenet.engine /app/src/deepstream_tao_apps/models/bodypose2d/model.etlt_b32_gpu0_fp16.engine
	docker exec -it -w /app/src/deepstream_tao_apps/apps/tao_others/deepstream-bodypose2d-app bodyposenet-camera ./deepstream-bodypose2d-app 3 /app/mnt/config.txt /dev/video0 test
 





