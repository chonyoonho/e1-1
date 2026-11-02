# 전체 수행 로그

> `scripts/run_all.sh` 실행 결과를 자동으로 모은 문서입니다. 원본: [logs/](../logs)

## 01_terminal.txt

```bash
# 수행 일시: 2026-11-02 15:11:52    

# ===== 현재 위치 확인 (절대 경로) =====

$ pwd
/c/Users/세세/AppData/Local/Claude-Data/claude_pzs8sxrjxfjjc/scratch-workspaces/b78b981e-fd17-443f-96a6-23cff441391d/67d4754e-3738-4146-a920-587e3469cabd/scratch-2026-11-01-78dbdc

# ===== 목록 확인 (숨김 파일 포함) =====

$ ls -la
total 43
drwxr-xr-x 1 세세 197121     0 Nov  2 15:11 .
drwxr-xr-x 1 세세 197121     0 Nov  1 17:01 ..
-rw-r--r-- 1 세세 197121    44 Nov  2 15:11 .env.example
drwxr-xr-x 1 세세 197121     0 Nov  2 15:08 .git
-rw-r--r-- 1 세세 197121    16 Nov  1 15:26 .gitignore
-rw-r--r-- 1 세세 197121 14718 Nov  1 15:29 README.md
drwxr-xr-x 1 세세 197121     0 Nov  1 15:26 app
-rw-r--r-- 1 세세 197121   406 Nov  2 15:11 docker-compose.yml
drwxr-xr-x 1 세세 197121     0 Nov  1 15:26 docs
drwxr-xr-x 1 세세 197121     0 Nov  2 15:11 logs
drwxr-xr-x 1 세세 197121     0 Nov  2 15:10 mount-site
drwxr-xr-x 1 세세 197121     0 Nov  2 15:11 scripts

# ===== 디렉토리 생성 (-p: 중간 경로까지 한 번에) =====

$ mkdir -p practice/docs practice/backup

# ===== 이동 (상대 경로 / 절대 경로) =====

$ cd practice && pwd
/c/Users/세세/AppData/Local/Claude-Data/claude_pzs8sxrjxfjjc/scratch-workspaces/b78b981e-fd17-443f-96a6-23cff441391d/67d4754e-3738-4146-a920-587e3469cabd/scratch-2026-11-01-78dbdc/practice

$ cd "$ROOT/practice/docs" && pwd
/c/Users/세세/AppData/Local/Claude-Data/claude_pzs8sxrjxfjjc/scratch-workspaces/b78b981e-fd17-443f-96a6-23cff441391d/67d4754e-3738-4146-a920-587e3469cabd/scratch-2026-11-01-78dbdc/practice/docs

$ cd practice/docs && cd ../.. && pwd
/c/Users/세세/AppData/Local/Claude-Data/claude_pzs8sxrjxfjjc/scratch-workspaces/b78b981e-fd17-443f-96a6-23cff441391d/67d4754e-3738-4146-a920-587e3469cabd/scratch-2026-11-01-78dbdc

# ===== 빈 파일 생성 / 내용 있는 파일 생성 =====

$ touch practice/empty.txt

$ echo "hello codyssey" > practice/hello.txt

$ ls -la practice
total 5
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 .
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 ..
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 backup
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 docs
-rw-r--r-- 1 세세 197121  0 Nov  2 15:11 empty.txt
-rw-r--r-- 1 세세 197121 15 Nov  2 15:11 hello.txt

# ===== 파일 내용 확인 =====

$ cat practice/hello.txt
hello codyssey

$ wc -c practice/empty.txt
0 practice/empty.txt

# ===== 복사 =====

$ cp practice/hello.txt practice/backup/hello.bak

$ cp -r practice/docs practice/docs_copy

$ ls -la practice practice/backup
practice:
total 5
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 .
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 ..
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 backup
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 docs
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 docs_copy
-rw-r--r-- 1 세세 197121  0 Nov  2 15:11 empty.txt
-rw-r--r-- 1 세세 197121 15 Nov  2 15:11 hello.txt

practice/backup:
total 1
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 .
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 ..
-rw-r--r-- 1 세세 197121 15 Nov  2 15:11 hello.bak

# ===== 이동 / 이름 변경 =====

$ mv practice/hello.txt practice/docs/greeting.txt

$ mv practice/docs_copy practice/docs_renamed

$ ls -la practice practice/docs
practice:
total 4
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 .
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 ..
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 backup
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 docs
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 docs_renamed
-rw-r--r-- 1 세세 197121 0 Nov  2 15:11 empty.txt

practice/docs:
total 1
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 .
drwxr-xr-x 1 세세 197121  0 Nov  2 15:11 ..
-rw-r--r-- 1 세세 197121 15 Nov  2 15:11 greeting.txt

# ===== 삭제 =====

$ rm practice/empty.txt

$ rm -r practice/docs_renamed

$ ls -la practice
total 4
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 .
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 ..
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 backup
drwxr-xr-x 1 세세 197121 0 Nov  2 15:11 docs

# ===== 정리 =====

$ rm -rf practice && echo "practice 삭제 완료"
practice 삭제 완료

```

## 02_permissions.txt

```bash
# 수행 일시: 2026-11-02 15:11:55    

# ===== (참고) 호스트 Git Bash 에서 chmod 시도 → 변화 없음 =====

$ cd "$(mktemp -d)" && touch f && ls -l f && chmod 600 f && ls -l f
-rw-r--r-- 1 세세 197121 0 Nov  2 15:11 f
-rw-r--r-- 1 세세 197121 0 Nov  2 15:11 f

$ mount | grep " on / "
C:/Program Files/Git on / type ntfs (binary,noacl,auto)

# ===== ubuntu 컨테이너 안에서 권한 실습 (+ 는 컨테이너 안에서 실행된 명령) =====

$ docker run --rm -i ubuntu:24.04 bash < "$ROOT/scripts/perm_inner.sh"
+ cd /tmp
+ mkdir perm-lab
+ cd perm-lab
+ echo secret
+ mkdir shared
+ stat -c '%A %a %n' memo.txt shared
-rw-r--r-- 644 memo.txt
drwxr-xr-x 755 shared
+ chmod 600 memo.txt
+ chmod 700 shared
+ stat -c '%A %a %n' memo.txt shared
-rw------- 600 memo.txt
drwx------ 700 shared
+ chmod u=rw,g=r,o=r memo.txt
+ chmod 755 shared
+ chmod u+x memo.txt
+ stat -c '%A %a %n' memo.txt shared
-rwxr--r-- 744 memo.txt
drwxr-xr-x 755 shared
+ useradd -m guest
+ chmod 700 shared
+ su guest -c 'ls /tmp/perm-lab/shared'
ls: cannot open directory '/tmp/perm-lab/shared': Permission denied
guest: shared 진입 거부 (700)
+ echo 'guest: shared 진입 거부 (700)'
+ chmod 755 shared
+ su guest -c 'ls -ld /tmp/perm-lab/shared && echo guest: 진입 가능 755'
drwxr-xr-x 2 root root 4096 Nov  2 06:11 /tmp/perm-lab/shared
guest: 진입 가능 755
+ chmod 600 memo.txt
+ su guest -c 'cat /tmp/perm-lab/memo.txt'
cat: /tmp/perm-lab/memo.txt: Permission denied
+ echo 'guest: memo.txt 읽기 거부 (600)'
guest: memo.txt 읽기 거부 (600)

```

## 03_docker_basics.txt

```bash
# 수행 일시: 2026-11-02 15:11:57    

# ===== 설치/데몬 점검 =====

$ docker --version
Docker version 29.9.2, build a82e528

$ docker info
Client:
 Version:    29.9.2
 Context:    desktop-linux
 Debug Mode: false
 Plugins:
  agent: Docker AI Agent Runner (Docker Inc.)
    Version:  v1.152.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-agent.exe
  ai: Docker AI Agent - Ask Gordon (Docker Inc.)
    Version:  v1.33.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-ai.exe
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.38.1
    Path:     C:\Program Files\Docker\cli-plugins\docker-buildx.exe
  compose: Docker Compose (Docker Inc.)
    Version:  v5.6.1
    Path:     C:\Program Files\Docker\cli-plugins\docker-compose.exe
  debug: Get a shell into any image or container (Docker Inc.)
    Version:  0.49.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-debug.exe
  desktop: Docker Desktop commands (Docker Inc.)
    Version:  4.97.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-desktop.exe
  dhi: CLI for managing Docker Hardened Images (Docker Inc.)
    Version:  v0.0.9
    Path:     C:\Program Files\Docker\cli-plugins\docker-dhi.exe
  extension: Manages Docker extensions (Docker Inc.)
    Version:  v0.2.32
    Path:     C:\Program Files\Docker\cli-plugins\docker-extension.exe
  init: Creates Docker-related starter files for your project (Docker Inc.)
    Version:  v1.4.1
    Path:     C:\Program Files\Docker\cli-plugins\docker-init.exe
  mcp: Docker MCP Plugin (Docker Inc.)
    Version:  v0.44.2
    Path:     C:\Program Files\Docker\cli-plugins\docker-mcp.exe
  model: Docker Model Runner (Docker Inc.)
    Version:  v1.2.9
    Path:     C:\Program Files\Docker\cli-plugins\docker-model.exe
  offload: Docker Offload (Docker Inc.)
    Version:  v0.7.21
    Path:     C:\Program Files\Docker\cli-plugins\docker-offload.exe
  pass: Docker Pass Secrets Manager Plugin (beta) (Docker Inc.)
    Version:  v0.3.2
    Path:     C:\Program Files\Docker\cli-plugins\docker-pass.exe
  sandbox: "docker sandbox" is deprecated, use Docker Sandboxes instead (Docker Inc.)
    Version:  v0.13.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-sandbox.exe
  scout: Docker Scout (Docker Inc.)
    Version:  v1.27.0
    Path:     C:\Program Files\Docker\cli-plugins\docker-scout.exe

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 4
 Server Version: 29.9.2
 Storage Driver: overlayfs
  driver-type: io.containerd.snapshotter.v1
 Logging Driver: local
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Discovered Devices:
  cdi: docker.com/gpu=webgpu
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 nvidia runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: b7a25261e029d68978bbf290df0a62fc819b3c51
 runc version: v1.5.2-0-g29dd3dc2
 init version: de40ad0
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.18.54.1-microsoft-standard-WSL2
 Operating System: Docker Desktop
 OSType: linux
 Architecture: x86_64
 CPUs: 4
 Total Memory: 7.715GiB
 Name: docker-desktop
 ID: 4f0594ba-f3ce-42ce-9097-46d15b3c958d
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 HTTP Proxy: http.docker.internal:3128
 HTTPS Proxy: http.docker.internal:3128
 No Proxy: hubproxy.docker.internal
 Labels:
  com.docker.desktop.address=npipe://\\.\pipe\docker_cli
 Experimental: false
 Insecure Registries:
  hubproxy.docker.internal:5555
  127.0.0.0/8
  ::1/128
 Live Restore Enabled: false
 Firewall Backend: iptables


# ===== 이미지 다운로드 / 목록 =====

$ docker pull hello-world
Using default tag: latest
latest: Pulling from library/hello-world
Digest: sha256:c567b231f65614688711a75f31518a064258a51d442117a3e771a3a8fdba78ef
Status: Image is up to date for hello-world:latest
docker.io/library/hello-world:latest

$ docker pull ubuntu:24.04
24.04: Pulling from library/ubuntu
Digest: sha256:fe81560990fae86dc4743202b2cb4d3df98d0bcf949173cecef15ce1127ef852
Status: Image is up to date for ubuntu:24.04
docker.io/library/ubuntu:24.04

$ docker images
IMAGE                ID             DISK USAGE   CONTENT SIZE   EXTRA
codyssey-web:1.0     e51059dfcb06       73.6MB           21MB        
hello-world:latest   c567b231f656       25.9kB         9.49kB        
redis:7-alpine       8da19c7399dc       57.8MB         16.7MB        
ubuntu:24.04         fe81560990fa        119MB         31.7MB        

# ===== hello-world 실행 =====

$ docker run --name hello hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/


# ===== ubuntu 컨테이너: 실행 → 내부 명령 (실행 후 자동 삭제 --rm) =====

$ docker run --rm ubuntu:24.04 bash -c "ls / && echo hello-from-ubuntu && head -2 /etc/os-release"
bin
boot
dev
etc
home
lib
lib64
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
hello-from-ubuntu
PRETTY_NAME="Ubuntu 24.04.5 LTS"
NAME="Ubuntu"

# ===== exec vs attach 차이 관찰 =====

$ docker run -dit --name ubu ubuntu:24.04 bash
79a51a0d7af536355e47f8f984599d79b7e045e2e744d24c652553a2253aed2c

$ docker exec ubu bash -c "echo exec 로 새 프로세스 실행; ps -ef"
exec 로 새 프로세스 실행
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0 11 06:12 pts/0    00:00:00 bash
root          10       0 83 06:12 ?        00:00:00 ps -ef

$ docker ps --filter name=ubu --format "{{.Names}} {{.Status}}"
ubu Up 1 second

$ echo exit | docker attach ubu
cannot attach stdin to a TTY-enabled container because stdin is not a terminal

$ docker run -di --name ubu-attach ubuntu:24.04 bash
f2d30c09ff1e5164e4543356c61525584d5362e973a2418ee2643907e0a88d67

$ docker ps --filter name=ubu-attach --format "{{.Names}} {{.Status}}"
ubu-attach Up Less than a second

$ echo exit | docker attach ubu-attach; sleep 1; docker ps -a --filter name=ubu --format "{{.Names}} {{.Status}}"
ubu-attach Exited (0) 1 second ago
ubu Up 4 seconds

# ===== 컨테이너 실행 / 목록 / 로그 / 리소스 / 중지 =====

$ docker run -d --name ticker ubuntu:24.04 bash -c "for i in \$(seq 1 1000); do echo tick \$i; sleep 1; done"
03960c69e8a78d20afd5fc247498941686a225c43421441495d8b1e682d42256

$ sleep 3; docker ps
CONTAINER ID   IMAGE          COMMAND                   CREATED         STATUS         PORTS     NAMES
03960c69e8a7   ubuntu:24.04   "bash -c 'for i in $…"   4 seconds ago   Up 3 seconds             ticker
79a51a0d7af5   ubuntu:24.04   "bash"                    9 seconds ago   Up 9 seconds             ubu

$ docker logs --tail 5 ticker
tick 1
tick 2
tick 3
tick 4

$ docker stats --no-stream
CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O   PIDS
03960c69e8a7   ticker    0.56%     1.324MiB / 7.715GiB   0.02%     872B / 126B     0B / 0B     2
79a51a0d7af5   ubu       0.00%     956KiB / 7.715GiB     0.01%     1.34kB / 126B   0B / 0B     1

$ docker stop ticker
ticker

$ docker ps -a
CONTAINER ID   IMAGE          COMMAND                   CREATED          STATUS                                PORTS     NAMES
03960c69e8a7   ubuntu:24.04   "bash -c 'for i in $…"   11 seconds ago   Exited (137) Less than a second ago             ticker
f2d30c09ff1e   ubuntu:24.04   "bash"                    14 seconds ago   Exited (0) 12 seconds ago                       ubu-attach
79a51a0d7af5   ubuntu:24.04   "bash"                    16 seconds ago   Up 16 seconds                                   ubu
2292becf121e   hello-world    "/hello"                  19 seconds ago   Exited (0) 18 seconds ago                       hello

# ===== 정리 =====

$ docker rm -f hello ubu ubu-attach ticker
hello
ubu
ubu-attach
ticker

```

## 04_build_run.txt

```bash
# 수행 일시: 2026-11-02 15:12:25    

# ===== 빌드 =====

$ docker build -t codyssey-web:1.0 ./app
#0 building with "desktop-linux" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 944B 0.0s done
#1 DONE 0.0s

#2 [internal] load metadata for docker.io/library/nginx:1.27-alpine
#2 DONE 0.9s

#3 [internal] load .dockerignore
#3 transferring context: 53B 0.0s done
#3 DONE 0.0s

#4 [internal] load build context
#4 transferring context: 242B 0.0s done
#4 DONE 0.0s

#5 [1/3] FROM docker.io/library/nginx:1.27-alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a10
#5 resolve docker.io/library/nginx:1.27-alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a10 0.1s done
#5 DONE 0.1s

#6 [2/3] COPY nginx/templates/ /etc/nginx/templates/
#6 CACHED

#7 [3/3] COPY site/ /usr/share/nginx/html/
#7 CACHED

#8 exporting to image
#8 exporting layers 0.0s done
#8 exporting manifest sha256:00695243cb8573a1ea3586fe578882b8bd6de33d993014b22569fde64f6cc02a 0.0s done
#8 exporting config sha256:eff31d460d20272525e26f620ad34969a2bbc287f0943569007729ad8ab69417 0.0s done
#8 exporting attestation manifest sha256:73bbf45fb47afee96cc09d92e1728fe2a6e42cba4498e91695e378da48efc714 0.0s done
#8 exporting manifest list sha256:96a2e9794770091c09605b78205349d1ad0f656b47516821f81ac797d902846b
#8 exporting manifest list sha256:96a2e9794770091c09605b78205349d1ad0f656b47516821f81ac797d902846b 0.0s done
#8 naming to docker.io/library/codyssey-web:1.0 done
#8 unpacking to docker.io/library/codyssey-web:1.0 0.0s done
#8 DONE 0.3s

$ docker images codyssey-web
IMAGE              ID             DISK USAGE   CONTENT SIZE   EXTRA
codyssey-web:1.0   96a2e9794770       73.6MB           21MB        

$ docker inspect --format "{{json .Config.Labels}}" codyssey-web:1.0
{"maintainer":"NGINX Docker Maintainers <docker-maint@nginx.com>","org.opencontainers.image.description":"Codyssey pre-course custom nginx image","org.opencontainers.image.title":"codyssey-web"}

$ docker inspect --format "{{json .Config.Env}}" codyssey-web:1.0
["PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin","NGINX_VERSION=1.27.5","PKG_RELEASE=1","DYNPKG_RELEASE=1","NJS_VERSION=0.8.10","NJS_RELEASE=1","APP_ENV=dev","NGINX_PORT=80"]

# ===== 포트 매핑 실행 (호스트 8080/8081 → 컨테이너 80) =====

$ docker run -d -p 8080:80 --name web-8080 codyssey-web:1.0
ff231d8046747e892aec8bd03b1115b9898396b54ddf5eb9da314d8244b36b49

$ docker run -d -p 8081:80 -e APP_ENV=prod --name web-8081 codyssey-web:1.0
7bbc00e838927d287a4bc1463149188fc08a9d30f2f10cfb10884b9cf00d7368

$ sleep 12; docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
NAMES      PORTS                                     STATUS
web-8081   0.0.0.0:8081->80/tcp, [::]:8081->80/tcp   Up 12 seconds (healthy)
web-8080   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   Up 13 seconds (healthy)

# ===== 접속 확인 =====

$ curl -si http://localhost:8080 | head -12
HTTP/1.1 200 OK
Server: nginx/1.27.5
Date: Mon, 02 Nov 2026 06:12:44 GMT
Content-Type: text/html
Content-Length: 650
Last-Modified: Sun, 01 Nov 2026 06:26:02 GMT
Connection: keep-alive
ETag: "6ae6db7a-28a"
X-App-Env: dev
Accept-Ranges: bytes

<!doctype html>

$ curl -si http://localhost:8081/health
HTTP/1.1 200 OK
Server: nginx/1.27.5
Date: Mon, 02 Nov 2026 06:12:44 GMT
Content-Type: text/plain
Content-Length: 3
Last-Modified: Sun, 01 Nov 2026 06:26:02 GMT
Connection: keep-alive
ETag: "6ae6db7a-3"
X-App-Env: prod
Accept-Ranges: bytes

ok

$ docker logs web-8080 2>&1 | tail -5
2026/11/02 06:12:30 [notice] 1#1: start worker process 36
2026/11/02 06:12:30 [notice] 1#1: start worker process 37
2026/11/02 06:12:30 [notice] 1#1: start worker process 38
2026/11/02 06:12:30 [notice] 1#1: start worker process 39
172.17.0.1 - - [02/Nov/2026:06:12:44 +0000] "GET / HTTP/1.1" 200 650 "-" "curl/8.21.0" "-"

>> 브라우저에서 http://localhost:8080 , http://localhost:8081 을 열고 주소창 포함 캡처 → docs/screenshots/
```

## 05_bind_mount.txt

```bash
# 수행 일시: 2026-11-02 15:12:45    

# ===== 바인드 마운트로 실행 (호스트 mount-site/ → 컨테이너 /usr/share/nginx/html) =====

$ docker run -d -p 8082:80 --name web-bind -v "C:/Users/세세/AppData/Local/Claude-Data/claude_pzs8sxrjxfjjc/scratch-workspaces/b78b981e-fd17-443f-96a6-23cff441391d/67d4754e-3738-4146-a920-587e3469cabd/scratch-2026-11-01-78dbdc/mount-site:/usr/share/nginx/html" codyssey-web:1.0
97ef6f241b9fcef6fdcb8b72bf54cd921faf2872ccc2c61e070e5cd144eb5d17

$ sleep 2; curl -s http://localhost:8082 | grep "site version"
    <p class="ver">site version: v1</p>

# ===== 호스트에서 파일 수정 (변경 전 v1 → 후 v2) =====

$ sed -i "s/site version: v1/site version: v2 (bind mount 즉시 반영)/" mount-site/index.html

$ curl -s http://localhost:8082 | grep "site version"
    <p class="ver">site version: v2 (bind mount 즉시 반영)</p>

$ docker exec web-bind grep "site version" /usr/share/nginx/html/index.html
    <p class="ver">site version: v2 (bind mount 즉시 반영)</p>

# ===== 비교: 마운트 없는 컨테이너(web-8080, 이미지에 구운 파일)는 그대로 v1 =====

$ curl -s http://localhost:8080 | grep "site version" || echo "web-8080 미실행"
    <p class="ver">site version: v1</p>

```

## 06_volume.txt

```bash
# 수행 일시: 2026-11-02 15:12:50    

# ===== 볼륨 생성 / 확인 =====

$ docker volume create codyssey-data
codyssey-data

$ docker volume ls
DRIVER    VOLUME NAME
local     codyssey-data

$ docker volume inspect codyssey-data
[
    {
        "CreatedAt": "2026-11-02T06:12:51Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/codyssey-data/_data",
        "Name": "codyssey-data",
        "Options": null,
        "Scope": "local"
    }
]

# ===== 컨테이너 1(vol-test)에 연결 후 데이터 기록 =====

$ docker run -d --name vol-test -v codyssey-data:/data ubuntu:24.04 sleep infinity
09df9147201ae8dc360511acd78afe6c039971ecffc6878def2fc4b63edcb117

$ docker exec vol-test bash -c "echo persisted-at-\$(date +%H%M%S) > /data/hello.txt && cat /data/hello.txt"
persisted-at-061254

# ===== 컨테이너 1 삭제 =====

$ docker rm -f vol-test
vol-test

$ docker ps -a --filter name=vol-test
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

# ===== 새 컨테이너 2(vol-test2)에 같은 볼륨 연결 → 데이터 유지 확인 =====

$ docker run -d --name vol-test2 -v codyssey-data:/data ubuntu:24.04 sleep infinity
5828f98777f7789ef524c21039c5fd15721448d5b07f299591a2584da5b0e686

$ docker exec vol-test2 cat /data/hello.txt
persisted-at-061254

# ===== 비교: 볼륨 없이 컨테이너 레이어에 쓴 데이터는 새 컨테이너에서 보이지 않음 =====

$ docker run --name novol ubuntu:24.04 bash -c "echo temp > /tmp/x.txt && cat /tmp/x.txt"
temp

$ docker rm novol
novol

$ docker run --rm ubuntu:24.04 cat /tmp/x.txt
cat: /tmp/x.txt: No such file or directory

# ===== 정리 =====

$ docker rm -f vol-test2
vol-test2

```

## 07_git.txt

```bash
# 수행 일시: 2026-11-02 15:13:20    

$ git --version
git version 2.55.0.windows.5

$ git config --list | mask
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=schannel
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
core.editor="C:\Users\세세\AppData\Local\Programs\Microsoft VS Code\bin\code" --wait
user.name=천윤호
user.email=yu***@gmail.com
init.defaultbranch=main
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true

$ git config --global init.defaultBranch
main

$ git branch --show-current
main

$ git remote -v | mask

$ git log --oneline -5
fatal: your current branch 'main' does not have any commits yet

```

## 08_compose.txt

```bash
# 수행 일시: 2026-11-02 15:13:01    

# ===== up / ps =====

$ docker compose up -d --build --quiet-pull 2>&1 | grep -v -E "^#|exporting|resolve|DONE|CACHED|transferring|naming|unpacking"
 Image codyssey-web:1.0 Building 









 Image codyssey-web:1.0 Built 
 Network codyssey_default Creating 
 Volume codyssey_redis-data Creating 
 Volume codyssey_redis-data Creating 
 Network codyssey_default Creating 
 Volume codyssey_redis-data Created 
 Volume codyssey_redis-data Created 
 Network codyssey_default Created 
 Network codyssey_default Created 
 Container codyssey-cache-1 Creating 
 Container codyssey-cache-1 Created 
 Container codyssey-web-1 Creating 
 Container codyssey-web-1 Created 
 Container codyssey-cache-1 Starting 
 Container codyssey-cache-1 Started 
 Container codyssey-web-1 Starting 
 Container codyssey-web-1 Started 

$ docker compose ps
NAME               IMAGE              COMMAND                   SERVICE   CREATED         STATUS                                     PORTS
codyssey-cache-1   redis:7-alpine     "docker-entrypoint.s…"   cache     2 seconds ago   Up 1 second                                6379/tcp
codyssey-web-1     codyssey-web:1.0   "/docker-entrypoint.…"   web       2 seconds ago   Up Less than a second (health: starting)   0.0.0.0:8088->80/tcp, [::]:8088->80/tcp

# ===== 접속 + 컨테이너 간 통신 (서비스 이름 cache 로 DNS 조회) =====

$ sleep 3; curl -si http://localhost:8088 | grep -i -E "HTTP/|X-App-Env"
HTTP/1.1 200 OK
X-App-Env: compose

$ docker compose exec -T web nslookup cache
Server:		127.0.0.11
Address:	127.0.0.11:53

Non-authoritative answer:
Name:	cache
Address: 172.18.0.2

Non-authoritative answer:


$ docker compose exec -T web sh -c "printf \"PING\r\n\" | nc -w 2 cache 6379"
+PONG

# ===== logs =====

$ docker compose logs --tail 5
web-1    | 2026/11/02 06:13:06 [notice] 1#1: start worker process 35
web-1    | 2026/11/02 06:13:06 [notice] 1#1: start worker process 36
web-1    | 2026/11/02 06:13:06 [notice] 1#1: start worker process 37
cache-1  | 1:C 02 Nov 2026 06:13:05.741 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
web-1    | 2026/11/02 06:13:06 [notice] 1#1: start worker process 38
web-1    | 172.18.0.1 - - [02/Nov/2026:06:13:10 +0000] "GET / HTTP/1.1" 200 650 "-" "curl/8.21.0" "-"
cache-1  | 1:M 02 Nov 2026 06:13:05.742 * monotonic clock: POSIX clock_gettime
cache-1  | 1:M 02 Nov 2026 06:13:05.745 * Running mode=standalone, port=6379.
cache-1  | 1:M 02 Nov 2026 06:13:05.745 * Server initialized
cache-1  | 1:M 02 Nov 2026 06:13:05.746 * Ready to accept connections tcp

# ===== 환경변수로 포트/모드 변경 (호스트 9090 → 컨테이너 8000, 모드 staging) =====

$ WEB_PORT=9090 NGINX_PORT=8000 APP_ENV=staging docker compose up -d
 Container codyssey-cache-1 Running 
 Container codyssey-web-1 Recreate 
 Container codyssey-web-1 Recreated 
 Container codyssey-web-1 Starting 
 Container codyssey-web-1 Started 

$ sleep 3; curl -si http://localhost:9090 | grep -i -E "HTTP/|X-App-Env"
HTTP/1.1 200 OK
X-App-Env: staging

$ docker compose ps
NAME               IMAGE              COMMAND                   SERVICE   CREATED          STATUS                            PORTS
codyssey-cache-1   redis:7-alpine     "docker-entrypoint.s…"   cache     13 seconds ago   Up 12 seconds                     6379/tcp
codyssey-web-1     codyssey-web:1.0   "/docker-entrypoint.…"   web       5 seconds ago    Up 4 seconds (health: starting)   0.0.0.0:9090->8000/tcp, [::]:9090->8000/tcp

# ===== down =====

$ docker compose down
 Container codyssey-web-1 Stopping 
 Container codyssey-web-1 Stopped 
 Container codyssey-web-1 Removing 
 Container codyssey-web-1 Removed 
 Container codyssey-cache-1 Stopping 
 Container codyssey-cache-1 Stopped 
 Container codyssey-cache-1 Removing 
 Container codyssey-cache-1 Removed 
 Network codyssey_default Removing 
 Network codyssey_default Removed 

$ docker compose ps -a
NAME      IMAGE     COMMAND   SERVICE   CREATED   STATUS    PORTS

```

