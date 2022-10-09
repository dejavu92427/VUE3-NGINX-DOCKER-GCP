# 估狗dockerfile multi stage


# 在node環境
FROM node:16.15.0 as build-env
# 工作目錄若無自動創建
WORKDIR /app
# .(當前資料夾) .(全部)
COPY . .

WORKDIR client
# run 指令
RUN node -v
RUN npm install
RUN npm run build

# 在nginx環境
FROM nginx:stable
# run 指令
RUN apt-get update
# build-env為node環境裡面的/app/.  複製到nginx 裡的html資料夾  (可在docker->container->cli 查看該資料夾)
COPY --from=build-env /app/client/dist/. /usr/share/nginx/html
# 改nginx配置
COPY /server/default.conf /etc/nginx/conf.d

# cmd 輸指令 
# 產生 image
# docker build -t asia.gcr.io/dogwood-dryad-364606 (gcp project ID) /myvue3-docker .(記得加.)

# push 更新
# docker push asia.gcr.io/dogwood-dryad-364606/myvue3-docker
