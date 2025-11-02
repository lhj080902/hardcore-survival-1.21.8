# 📦 설치 가이드

> **하드코어 생존기 서버팩 설치 방법**

---

## 📋 시작하기 전에

### 필요 사항
- ☕ **Java 21** 이상
- 💾 **최소 4GB RAM**
- 🌐 인터넷 연결 (Paper 다운로드용)

---

## 🪟 Windows 설치

### 1️⃣ Java 설치 확인
```cmd
java -version
```

Java가 없거나 버전이 낮으면:
- [Adoptium JDK 21 다운로드](https://adoptium.net/temurin/releases/?version=21)

### 2️⃣ 서버 다운로드
1. 이 저장소를 다운로드하거나 클론:
```cmd
git clone https://github.com/lhj080902/hardcore-survival-1.21.8.git
cd hardcore-survival-1.21.8
```

2. Paper 서버 다운로드:
   - [Paper 1.21.8 다운로드](https://papermc.io/downloads/paper)
   - 다운로드한 파일을 `server.jar`로 이름 변경
   - 서버팩 폴더에 복사

### 3️⃣ 서버 시작
```cmd
start.bat
```

처음 실행 시 EULA 동의 여부를 묻습니다. `Y`를 입력하세요.

### 4️⃣ 서버 접속
- 마인크래프트 클라이언트에서 **1.21.8** 버전 선택
- 멀티플레이 → 서버 추가 → `localhost` 입력

---

## 🐧 Linux 설치

### 1️⃣ Java 설치
**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install openjdk-21-jdk
```

**CentOS/RHEL:**
```bash
sudo yum install java-21-openjdk
```

**Arch Linux:**
```bash
sudo pacman -S jdk21-openjdk
```

설치 확인:
```bash
java -version
```

### 2️⃣ 서버 다운로드
```bash
# 저장소 클론
git clone https://github.com/lhj080902/hardcore-survival-1.21.8.git
cd hardcore-survival-1.21.8

# Paper 다운로드
wget https://api.papermc.io/v2/projects/paper/versions/1.21.8/builds/[BUILD]/downloads/paper-1.21.8-[BUILD].jar -O server.jar

# 또는 직접 다운로드:
# https://papermc.io/downloads/paper
```

### 3️⃣ 실행 권한 부여
```bash
chmod +x start.sh
```

### 4️⃣ 서버 시작
```bash
./start.sh
```

처음 실행 시 EULA 동의 여부를 묻습니다. `y`를 입력하세요.

### 5️⃣ 백그라운드 실행 (선택사항)
```bash
# screen 사용
screen -S minecraft
./start.sh
# Ctrl+A, D로 분리

# 다시 접속
screen -r minecraft

# 또는 tmux 사용
tmux new -s minecraft
./start.sh
# Ctrl+B, D로 분리

# 다시 접속
tmux attach -t minecraft
```

---

## 🍎 macOS 설치

### 1️⃣ Homebrew 설치 (없는 경우)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2️⃣ Java 설치
```bash
brew install openjdk@21

# PATH 설정
echo 'export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### 3️⃣ 서버 다운로드
```bash
# 저장소 클론
git clone https://github.com/lhj080902/hardcore-survival-1.21.8.git
cd hardcore-survival-1.21.8

# Paper 다운로드
curl -o server.jar https://api.papermc.io/v2/projects/paper/versions/1.21.8/builds/[BUILD]/downloads/paper-1.21.8-[BUILD].jar

# 또는 직접 다운로드:
# https://papermc.io/downloads/paper
```

### 4️⃣ 실행 권한 부여
```bash
chmod +x start.sh
```

### 5️⃣ 서버 시작
```bash
./start.sh
```

---

## ⚙️ 서버 설정

### 메모리 설정 변경

**RAM이 부족한 경우** (2GB RAM):

**Windows (start.bat):**
```batch
java -Xmx2G -Xms1G -jar server.jar nogui
```

**Linux/Mac (start.sh):**
```bash
java -Xmx2G -Xms1G -jar server.jar nogui
```

**RAM이 충분한 경우** (8GB RAM):
```bash
java -Xmx8G -Xms4G -jar server.jar nogui
```

### 포트 설정 (원격 접속)
1. `server.properties` 파일 열기
2. 다음 설정 확인:
```properties
server-port=25565
```

3. 방화벽 포트 열기:

**Windows:**
```cmd
netsh advfirewall firewall add rule name="Minecraft Server" dir=in action=allow protocol=TCP localport=25565
```

**Linux (UFW):**
```bash
sudo ufw allow 25565/tcp
```

**Linux (firewalld):**
```bash
sudo firewall-cmd --permanent --add-port=25565/tcp
sudo firewall-cmd --reload
```

---

## 🔑 권한 설정

### 관리자 권한 부여

1. 서버를 한 번 실행하여 `ops.json` 파일 생성
2. 게임 내에서 `/op <플레이어명>` 입력

또는 `ops.json` 파일 직접 수정:
```json
[
  {
    "uuid": "플레이어-UUID",
    "name": "플레이어명",
    "level": 4
  }
]
```

### 플러그인 권한

**LuckPerms 설치 (권장):**
1. [LuckPerms 다운로드](https://luckperms.net/download)
2. `plugins/` 폴더에 복사
3. 서버 재시작
4. 권한 부여:
```
/lp user <플레이어명> permission set hardcore.admin true
/lp user <플레이어명> permission set nickname.admin true
```

---

## ✅ 설치 확인

서버가 정상적으로 시작되면 다음 메시지가 표시됩니다:

```
✓ 하드코어 생존기 시스템 활성화!
✓ 하드코어 생존기 제작 시스템 활성화!
✓ 하드코어 생존기 명령어 시스템 활성화!
✓ 하드코어 생존기 관리자 시스템 활성화!
✓ 하드코어 중복 검사 시스템 활성화!
✓ 한글 닉네임 시스템 활성화!
```

게임 내에서 `/hchelp`와 `/nmhelp`를 입력하여 명령어를 확인하세요!

---

## 🆘 문제 해결

### "Unable to access jarfile server.jar"
- `server.jar` 파일이 스크립트와 같은 폴더에 있는지 확인
- Paper 다운로드 후 파일명을 정확히 `server.jar`로 변경

### "Unsupported Java version"
- Java 21 이상이 설치되어 있는지 확인
- `java -version` 명령어로 버전 확인

### 스크립트 실행이 안 됨 (Linux/Mac)
```bash
chmod +x start.sh
./start.sh
```

### 포트가 이미 사용 중
- `server.properties`에서 포트 변경 (`server-port=25566`)
- 또는 기존 서버 종료

### 메모리 부족 오류
- start.bat 또는 start.sh에서 메모리 설정 줄이기
- 최소 요구사항: `-Xmx2G -Xms1G`

---

## 📚 다음 단계

설치가 완료되었다면:
1. [README.md](README.md)에서 게임 시스템 확인
2. `/hchelp`로 하드코어 명령어 확인
3. `/nmhelp`로 닉네임 명령어 확인
4. 친구들을 초대하고 즐기세요! 🎮

---

**문제가 계속되나요?**
- [이슈 등록](https://github.com/lhj080902/hardcore-survival-1.21.8/issues)
- [README.md 문제 해결 섹션](README.md#-문제-해결) 참고
