# bodyposenet-on-deepstream
bodyposenet-on-deepstream は、DeepStream 上で BodyPoseNet の AIモデル を動作させるマイクロサービスです。  

## 動作環境
- NVIDIA 
    - DeepStream
- BodyPoseNet
- Docker
- TensorRT Runtime

## BodyPoseNetについて
BodyPoseNet は、骨格予測のための、画像内における複数人の姿勢推定を行うAIモデルです。  

## 動作手順
### Dockerコンテナの起動
Makefile に記載された以下のコマンドにより、BodyPoseNet の Dockerコンテナ を起動します。
```
docker-run: 
	docker-compose -f docker-compose.yaml up -d
```
### ストリーミングの開始
Makefile に記載された以下のコマンドにより、DeepStream 上の BodyPoseNet でストリーミングを開始します。  
```
stream-start: ## ストリーミングを開始する
	xhost +
	docker exec -it deepstream-bodyposenet deepstream-app -c /app/src/deepstream_app_source1_bodyposenet.txt
```
## 相互依存関係にあるマイクロサービス  
本マイクロサービスを実行するために BodyPoseNet の AIモデルを最適化する手順は、[bodyposenet-on-tao-toolkit](https://github.com/latonaio/bodyposenet-on-tao-toolkit)を参照してください。  


## engineファイルについて
engineファイルである bodyposenet.engine は、[bodyposenet-on-tao-toolkit](https://github.com/latonaio/bodyposenet-on-tao-toolkit)と共通のファイルであり、当該レポジトリで作成した engineファイルを、本リポジトリで使用しています。  

