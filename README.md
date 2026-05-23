# 공팅 (Gongting)

한국공학대학교(한국공대) 학생을 위한 **블라인드 매칭 서비스** UI 프로토타입입니다.  
프로필·매칭·회원 기능 화면을 정적 HTML/CSS/JS로 구성했습니다.

**라이브 사이트:** [https://yheun03.github.io/gongting/intro.html](https://yheun03.github.io/gongting/intro.html)

---

## 주요 화면

| 구분     | 경로             | 설명                                    |
| -------- | ---------------- | --------------------------------------- |
| 인트로   | `intro.html`     | 서비스 소개, 로그인·회원가입 진입       |
| 회원     | `html/user/`     | 로그인, 회원가입, 프로필, 설정, 인증 등 |
| 매칭     | `html/match/`    | 매칭 등록, 목록, 결과                   |
| 컴포넌트 | `component.html` | UI 컴포넌트 모음                        |

---

## 기술 스택

- HTML5
- CSS (SCSS 소스 → `resources/styles/` 컴파일 CSS)
- JavaScript (jQuery 2.2.4, Slick Carousel)
- 폰트: [Pretendard](https://github.com/orioncactus/pretendard)

---

## 프로젝트 구조

```
gongting/
├── intro.html              # 랜딩(인트로)
├── component.html          # 컴포넌트 가이드
├── html/
│   ├── user/               # 회원·프로필 관련 페이지
│   └── match/              # 매칭 관련 페이지
├── resources/
│   ├── styles/             # CSS (scss/, *.css)
│   ├── scripts/            # jQuery, Slick, scripts.js
│   ├── fonts/              # Pretendard 웹폰트
│   ├── icons/              # SVG 아이콘
│   ├── images/             # 프로필·일러스트 이미지
│   └── favicon/            # 파비콘·manifest
├── scripts/
│   └── build-gh-pages.sh   # GitHub Pages용 빌드 스크립트
└── .github/workflows/
    └── deploy-pages.yml    # 자동 배포 워크플로
```

---

## 로컬에서 보기

저장소 루트에서 정적 파일 서버를 띄운 뒤 브라우저로 접속합니다.

```bash
# Python 3
python3 -m http.server 8080

# 또는 npx
npx serve .
```

예: [http://localhost:8080/intro.html](http://localhost:8080/intro.html)

> 로컬에서는 HTML/CSS에 `/resources/...` 형태의 **루트 절대 경로**를 사용합니다.  
> 웹 서버를 **저장소 루트**에 맞춰 실행해야 스타일·이미지가 정상 로드됩니다.

---

## 배포 (GitHub Pages)

이 프로젝트는 **`gh-pages` 브랜치**를 통해 GitHub Pages에 배포됩니다.

### 배포 URL

| 페이지                | URL                                           |
| --------------------- | --------------------------------------------- |
| 루트 (→ intro로 이동) | https://yheun03.github.io/gongting/           |
| 인트로                | https://yheun03.github.io/gongting/intro.html |

저장소가 `username.github.io/저장소이름/` 형태이므로, 배포 시 자산 경로 앞에 `/gongting`이 붙도록 빌드합니다.

### 자동 배포 흐름

1. `main` 브랜치에 push (또는 Actions에서 수동 실행)
2. [Deploy GitHub Pages](.github/workflows/deploy-pages.yml) 워크플로 실행
3. `scripts/build-gh-pages.sh`로 `_site/` 생성
4. [peaceiris/actions-gh-pages](https://github.com/peaceiris/actions-gh-pages)가 `gh-pages` 브랜치에 푸시
5. GitHub Pages가 `gh-pages` 브랜치 내용을 사이트로 게시

### 배포 전 로컬 빌드 확인

```bash
bash scripts/build-gh-pages.sh
```

생성된 `_site/` 폴더는 배포용 산출물입니다. 경로가 `/gongting/...`로 변환된 상태이므로, 로컬에서 그대로 열면 일부 링크는 GitHub Pages 환경과 다를 수 있습니다.

### 수동 재배포

GitHub 저장소 → **Actions** → **Deploy GitHub Pages** → **Run workflow**

### Pages 설정 (최초 1회)

저장소 **Settings → Pages**에서 다음을 확인합니다.

- **Source:** Deploy from a branch
- **Branch:** `gh-pages` / `/ (root)`

---

## 스타일 수정

SCSS 소스는 `resources/styles/scss/`에 있습니다. 수정 후 컴파일된 CSS(`styles.css`, `common.css` 등)를 함께 반영하거나, 사용 중인 빌드 도구로 SCSS를 다시 컴파일해 주세요.

---

## 라이선스

[MIT License](LICENSE) — Copyright (c) 2024 Nyoung_Ni
