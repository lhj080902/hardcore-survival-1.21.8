# 🎮 하드코어 생존기 서버팩 v1.0

> **Minecraft 1.21.8 하드코어 생존 서버를 위한 완전한 서버팩**

[![Minecraft](https://img.shields.io/badge/Minecraft-1.21.8-green.svg)](https://www.minecraft.net/)
[![Paper](https://img.shields.io/badge/Paper-1.21.8-blue.svg)](https://papermc.io/)
[![Skript](https://img.shields.io/badge/Skript-2.12.2-yellow.svg)](https://github.com/SkriptLang/Skript)
[![License](https://img.shields.io/badge/License-Free-brightgreen.svg)](LICENSE)

---

## 📋 목차

- [소개](#-소개)
- [주요 기능](#-주요-기능)
- [설치 방법](#-설치-방법)
- [게임 시스템](#-게임-시스템)
- [명령어 가이드](#-명령어-가이드)
- [제작 시스템](#-제작-시스템)
- [문제 해결](#-문제-해결)
- [크레딧](#-크레딧)

---

## 🎯 소개

이 서버팩은 마인크래프트 1.21.8에서 작동하는 **하드코어 생존 서버**를 위해 제작되었습니다.

### 제작 목적
- ⚔️ 일반 생존 서버에 **긴장감**과 **협동 요소** 추가
- 💀 사망에 **의미를 부여**하고 **동료 구출 시스템** 제공
- 🇰🇷 **한글 닉네임**을 자유롭게 사용할 수 있는 시스템
- 🤝 플레이어 간 **협력을 유도**하는 부활 메커니즘

---

## ✨ 주요 기능

### 하드코어 생존 시스템
- ☠️ **사망 시 관전 모드** 전환 및 시체 생성
- 🎫 **부활 토큰** 및 **생명의 메아리**를 통한 부활
- 📦 **시체 회수** 및 재설치 시스템
- 🔄 **회차 관리** 및 월드 리셋 기능

### 한글 닉네임 시스템
- 📝 **한글 닉네임** 자유 변경
- 💾 **11개 슬롯**에 닉네임 저장 가능
- 👁️ 머리 위 **텍스트 표시** (벽 너머에서도 보임)
- 💬 채팅, 탭 리스트, 사망 메시지 모두 적용

---

## 📥 설치 방법

### 1️⃣ 필요 사항
- ☕ **Java 21** 이상
- 🖥️ **Paper 1.21.8** 서버 엔진 ([다운로드](https://papermc.io/downloads/paper))
- 🔌 **플러그인** (포함됨):
  - Skript 2.12.2
  - skript-reflect 2.6.1
  - SkBee 3.12.3
- 💾 최소 **4GB RAM** 권장

### 2️⃣ 설치 단계

```bash
# 1. 저장소 클론
git clone https://github.com/lhj080902/hardcore-survival-1.21.8.git
cd hardcore-survival-1.21.8

# 2. Paper 서버 다운로드 (server.jar로 이름 변경)
# https://papermc.io/downloads/paper 에서 1.21.8 다운로드

# 3. eula.txt 생성
echo eula=true > eula.txt

# 4. 서버 시작 스크립트 생성 (start.bat - Windows)
echo @echo off > start.bat
echo java -Xmx4G -Xms2G -jar server.jar nogui >> start.bat
echo pause >> start.bat

# Linux/Mac의 경우 start.sh
echo "#!/bin/bash" > start.sh
echo "java -Xmx4G -Xms2G -jar server.jar nogui" >> start.sh
chmod +x start.sh

# 5. 서버 시작
# Windows: start.bat 실행
# Linux/Mac: ./start.sh 실행
```

### 3️⃣ 서버 첫 실행 확인

서버가 정상적으로 시작되면 다음 메시지가 표시됩니다:
```
✓ 하드코어 생존기 시스템 활성화!
✓ 하드코어 생존기 제작 시스템 활성화!
✓ 하드코어 생존기 명령어 시스템 활성화!
✓ 하드코어 생존기 관리자 시스템 활성화!
✓ 하드코어 중복 검사 시스템 활성화!
✓ 한글 닉네임 시스템 활성화!
```

---

## 🎮 게임 시스템

### 💀 하드코어 생존 시스템

#### 사망 처리
1. 플레이어 사망 시 **관전 모드**로 전환
2. 사망 위치에 **시체(아머스탠드)** 생성
3. 아이템은 **통(배럴)**에 자동 저장
4. 위험한 죽음(용암, 낙사 등)은 **스폰에서 부활**

#### 부활 방법

| 방법 | 설명 | 사용법 |
|------|------|--------|
| 🎫 **부활 토큰** | 자가 부활 (토큰 1개 소모) | `/revive` 명령어 |
| 💎 **생명의 메아리** | 다른 플레이어가 부활 | 우클릭으로 사용 |

#### 시체 회수
- 🤕 **나무 막대기**로 시체 우클릭 → 머리 획득
- ⏰ **5분 쿨타임** 적용
- 📦 머리 재설치 시 시체 복원

### 🏷️ 한글 닉네임 시스템

- 📝 자유롭게 한글 닉네임 변경
- 💾 0~10번 슬롯에 닉네임 저장 (총 11개)
- 👁️ 머리 위 텍스트로 표시
- 🧱 벽 뒤에서도 보임
- 💬 채팅, 탭, 사망 메시지 모두 적용

---

## 📜 명령어 가이드

### 👤 일반 플레이어 명령어 (하드코어)

| 명령어 | 설명 |
|--------|------|
| `/hcstatus` | 현재 상태 확인 (회차, 생존/사망, 토큰) |
| `/revive` | 부활 토큰으로 부활 (2번 확인 필요) |
| `/heads` | 모든 플레이어 상태 목록 |
| `/gethead <플레이어>` | 사망한 플레이어의 머리 회수 |
| `/craftecho [개수/max]` | 생명의 메아리 제작 |
| `/hchelp` | 전체 도움말 |

### 🏷️ 일반 플레이어 명령어 (닉네임)

| 명령어 | 설명 |
|--------|------|
| `/nmchange <닉네임>` | 닉네임 변경 |
| `/nmsave <번호> <닉네임>` | 닉네임 저장 (0~10) |
| `/nmload <번호>` | 저장된 닉네임 불러오기 |
| `/nmlist <플레이어>` | 플레이어의 닉네임 목록 |
| `/nmremove <번호>` | 저장된 닉네임 제거 |
| `/nmcheck <닉네임>` | 원래 플레이어 확인 |
| `/nmreset` | 닉네임 초기화 |
| `/nmhelp` | 닉네임 도움말 |

### 🔑 관리자 명령어 (하드코어)
> 권한: `hardcore.admin`

| 명령어 | 설명 |
|--------|------|
| `/setround <회차>` | 회차 설정 |
| `/givetoken add/set <플레이어> <개수>` | 토큰 지급 |
| `/givetokenall add/set <개수>` | 전체 토큰 지급 |
| `/makeecho [개수]` | 생명의 메아리 직접 지급 (최대 128개) |
| `/testgethead <플레이어>` | 강제 머리 획득 (쿨타임 무시) |
| `/hcbarrel` | 통 저장 시스템 ON/OFF |
| `/hcdebug` | 디버그 모드 ON/OFF |
| `/hcreset` | 월드 리셋 (되돌릴 수 없음!) |
| `/cleancorpses` | 모든 시체 제거 |
| `/clearheads <플레이어>` | 특정 머리 아이템 전체 제거 |
| `/checkduplicates` | 중복 머리 검사 |

### 🔑 관리자 명령어 (닉네임)
> 권한: `nickname.admin`

| 명령어 | 설명 |
|--------|------|
| `/nmadminforce <플레이어> <닉네임>` | 강제 닉네임 변경 |
| `/nmadminclear <플레이어> <번호>` | 저장된 슬롯 제거 |
| `/nmadminreset <플레이어>` | 닉네임 초기화 |
| `/nmadminclearslots <플레이어>` | 모든 슬롯 제거 |

---

## 🛠️ 제작 시스템

### 💎 생명의 메아리 제작

#### 필요 재료 (1개당)
```
✓ 구리 주괴 x1
✓ 철 주괴 x1
✓ 금 주괴 x1
✓ 다이아몬드 x1
✓ 바다의 심장 x1
✓ 레드스톤 x1
✓ 청금석 x1
✓ 에메랄드 x1
✓ 네더라이트 파편 x1
```

#### 제작 방법
```
1. 재료를 인벤토리에 준비
2. /craftecho [개수] 입력
   - /craftecho        → 1개 제작
   - /craftecho 5      → 5개 제작 (2번 확인 필요)
   - /craftecho max    → 최대 개수 제작
3. 2개 이상 제작 시 10초 이내 재확인
```

#### 사용 방법
```
1. 생명의 메아리 우클릭
2. 10블록 내 시체 자동 탐지 및 부활
3. 부활자에게 저항 III, 구속 II (5초) 부여
4. 아이템 소모
```

---

## 🔧 문제 해결

<details>
<summary><b>Q1. 서버가 시작되지 않습니다</b></summary>

**A:** Java 21 이상이 설치되어 있는지 확인하세요.
```bash
java -version
```
Java 21 미만이면 [여기서 다운로드](https://adoptium.net/)
</details>

<details>
<summary><b>Q2. 스크립트가 로드되지 않습니다</b></summary>

**A:** plugins 폴더에 다음 파일이 있는지 확인:
- `Skript-2.12.2.jar`
- `skript-reflect-2.6.1.jar`

없다면 서버를 재시작하세요.
</details>

<details>
<summary><b>Q3. 닉네임이 머리 위에 표시되지 않습니다</b></summary>

**A:** 다음을 시도하세요:
1. 서버 재시작
2. `/nmreset` 후 닉네임 재설정
3. 재접속
</details>

<details>
<summary><b>Q4. 시체가 너무 많이 쌓였습니다</b></summary>

**A:** 관리자 권한으로 `/cleancorpses` 사용
</details>

<details>
<summary><b>Q5. 월드를 리셋하고 싶습니다</b></summary>

**A:**
1. `/hcreset` 명령어 2번 입력 (10초 이내)
2. `/stop`으로 서버 종료
3. `world`, `world_nether`, `world_the_end` 폴더 삭제
4. 서버 재시작
</details>

<details>
<summary><b>Q6. 권한을 설정하고 싶습니다</b></summary>

**A:** LuckPerms 등의 권한 플러그인 사용:
- `hardcore.admin` - 하드코어 관리자 권한
- `nickname.admin` - 닉네임 관리자 권한
</details>

---

## 📁 스크립트 파일 설명

| 파일 | 설명 |
|------|------|
| `hardcore-main.sk` | 메인 시스템 (사망, 부활, 시체 생성) |
| `hardcore-commands.sk` | 일반 플레이어 명령어 |
| `hardcore-admin.sk` | 관리자 명령어 |
| `hardcore-crafting.sk` | 생명의 메아리 제작 시스템 |
| `hardcore-duplicate-check.sk` | 머리 중복 검사 시스템 |
| `hardcore-nickname.sk` | 한글 닉네임 시스템 |

---

## 👥 크레딧

### 제작
- **coffee0001** - 기획, 디자인, 테스트, 시스템 설계
- **Claude (Anthropic AI)** - 스크립트 작성, 버그 수정, 최적화

### 사용된 도구
- [Minecraft 1.21.8](https://www.minecraft.net/)
- [Paper Server](https://papermc.io/)
- [Skript 2.12.2](https://github.com/SkriptLang/Skript)
- [skript-reflect 2.6.1](https://github.com/TPGamesNL/skript-reflect)
- [SkBee 3.12.3](https://github.com/ShaneBeee/SkBee)

### 특별 감사
- Skript 커뮤니티
- Paper 개발팀
- 모든 테스터 및 플레이어 여러분

---

## 📄 라이선스

이 서버팩은 **자유롭게 사용, 수정, 배포**할 수 있습니다.
출처를 표기해주시면 감사하겠습니다.

상업적 사용 시에도 별도의 허가는 필요하지 않으나,
제작자에게 알려주시면 감사하겠습니다.

---

## 📞 연락처

문의사항이나 버그 제보는 다음으로 연락해주세요:
- **GitHub Issues**: [이슈 등록](https://github.com/lhj080902/hardcore-survival-1.21.8/issues)
- **GitHub**: [@lhj080902](https://github.com/lhj080902)

---

<div align="center">

**Made with ❤️ by coffee0001 & Claude**

⭐ 이 프로젝트가 마음에 드셨다면 Star를 눌러주세요! ⭐

</div>

