#!/bin/bash

# -u オプションは未定義変数を使うとError
set -u

# ${hoge##*/}でブランチ名が/で区切られていたとき、最後だけ持ってくる
# 強み：feature/hoge
# 弱み：alpha/hogeとbeta/hoge
# TODO: GithubActionsでもここでブランチ名を取得できるなら、if文消せる
if [ -z "${CURRENT_BRANCH:+$CURRENT_BRANCH}" ]; then
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
fi
CURRENT_BRANCH=${CURRENT_BRANCH##*/}

# コミットIDの最初の8文字
COMMIT_ID=`git show -s --format=%H`
COMMIT_ID=${COMMIT_ID:0:8}

# DockerImageのビルド
if [ -z "${DOCKER_IMAGE:+$DOCKER_IMAGE}" ]; then
  read DOCKER_IMAGE
fi
NGINX_VERSION_TAG=stable
IMAGE_TAG="${CURRENT_BRANCH}--${COMMIT_ID}"

docker build \
  --tag ${DOCKER_IMAGE}:${IMAGE_TAG} \
  --build-arg RUBY_IMAGE_TAG=${RUBY_IMAGE_TAG} \
  .

docker tag ${DOCKER_IMAGE}:${IMAGE_TAG} ${DOCKER_IMAGE}:latest

# 以下のように書かない理由：GitHubActionと手動実行時とできるだけ同じにするため
# echo "##[set-output name=image_tag;]$(echo ${IMAGE_TAG})"
echo "built docker image"
echo ${DOCKER_IMAGE}:${IMAGE_TAG}
