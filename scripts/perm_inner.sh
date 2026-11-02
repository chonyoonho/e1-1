set -x
cd /tmp && mkdir perm-lab && cd perm-lab
echo "secret" > memo.txt
mkdir shared

# 변경 전 (기본 umask 022 → 파일 644, 디렉토리 755)
stat -c "%A %a %n" memo.txt shared

# 파일: 644 → 600 (소유자만 읽기/쓰기)
chmod 600 memo.txt
# 디렉토리: 755 → 700 (소유자만 목록/진입)
chmod 700 shared
stat -c "%A %a %n" memo.txt shared

# 기호 표기로 원복 + 실행 권한 실험
chmod u=rw,g=r,o=r memo.txt
chmod 755 shared
chmod u+x memo.txt
stat -c "%A %a %n" memo.txt shared

# 일반 사용자 관점에서 권한 효과 확인
useradd -m guest
chmod 700 shared
su guest -c "ls /tmp/perm-lab/shared" || echo "guest: shared 진입 거부 (700)"
chmod 755 shared
su guest -c "ls -ld /tmp/perm-lab/shared && echo guest: 진입 가능 755"
chmod 600 memo.txt
su guest -c "cat /tmp/perm-lab/memo.txt" || echo "guest: memo.txt 읽기 거부 (600)"
