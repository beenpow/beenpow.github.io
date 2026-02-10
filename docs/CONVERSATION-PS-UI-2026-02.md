# 대화 정리: PS 페이지 UI 및 갤러리 (2026-02)

이 문서는 PS(Problem Solving) 페이지와 갤러리 관련 수정 사항을 정리한 대화 요약입니다.

---

## 1. PS 메인 페이지 (`/ps/`)

### 요청
- 메인 PS 페이지에서 **전체 포스트 목록을 숨기고**, 카테고리 네비게이션만 보이게 할 것.
- LeetCode를 **맨 위**, Samsung Coding Test를 **맨 아래**로 재배치.
- UI 정리, 유령 이모지(👻) 제거.

### 수정 파일
- **`ps/index.md`**
  - catalogue(전체 목록) 블록 제거.
  - 섹션 순서: LeetCode → Codeforces & BOJ → Samsung Coding Test.
  - "Title :" 레이블 + 링크 버튼만 사용, 이모지 제거.
  - 스타일: `.ps-section`, `.ps-title`, `.ps-links` 등으로 정리.

### 참고
- **GitHub Pages**에 반영하려면 `ps/index.md` 변경 후 **커밋·푸시** 필요.
- 로컬에서만 보려면 `bundle exec jekyll serve` 후 `http://localhost:4000/ps/` 확인.

---

## 2. 카테고리 페이지 갤러리 (예: `/ps/LEETCODE/MEDIUM/`)

### 요청
- 리스트 대신 **갤러리(그리드 카드)** 형태.
- 카드에는 **문제 제목**, **푼 날짜**, **View / LeetCode 링크만** 표시.
- 제목에서 `Leetcode::`, `problem(54)` 등 접두어/문제 번호 제거.
- "Title :" 레이블로 깔끔하게 표시.
- LeetCode 버튼 클릭 시 **본문에 있는 `[Link](https://leetcode.com/...)` URL**로 이동.

### 수정·추가 파일

| 파일 | 역할 |
|------|------|
| **`_includes/post-list-ps-gallery.html`** | 갤러리 카드 한 개: Title : (정리된 제목), 날짜, View 링크, LeetCode 링크(있을 때만). |
| **`_sass/_ps-gallery.scss`** | `.ps-gallery` 그리드, `.ps-gallery-item` 카드, `.ps-gallery-links` 버튼 스타일. |
| **`styles.scss`** | `@import 'ps-gallery';` 추가. |
| **`_plugins/ps_filters.rb`** | `strip_problem_prefix`, `leetcode_url_from_page` 필터. |

### 적용된 카테고리 index
- `ps/LEETCODE/EASY/index.md`, `MEDIUM/index.md`, `HARD/index.md`
- `ps/BOJ/index.md`, `ps/USACO/index.md`, `ps/PRO/index.md`
- `ps/COFO/coforound/index.md`, `ps/COFO/cofoeach/index.md`
- `ps/JONGMAN/index.md`, `ps/FAILNOTE/index.md`, `ps/SWEA/index.md`

위 파일들에서 `<ul class="catalogue">` + `post-list.html` 대신  
`<div class="ps-gallery">` + `post-list-ps-gallery.html` 사용.

---

## 3. 플러그인 `_plugins/ps_filters.rb`

### 필터 1: `strip_problem_prefix`
- **용도:** 제목에서 `problem(54)`, `problem (1650) ` 같은 패턴 제거.
- **사용:** `{{ page.title | strip_problem_prefix | remove: "Leetcode:: " | ... }}`
- **로직:** `input.to_s`에 정규식 `problem\s*\(\s*\d+\s*\)\s*` (대소문자 무시) 적용 후 strip.

### 필터 2: `leetcode_url_from_page`
- **용도:** 원본 .md 파일에서 첫 `](https://leetcode.com/...)` URL 추출.
- **사용:** `{% assign leet_url = page | leetcode_url_from_page: site %}`
- **로직:** `page.path`로 파일 읽기 → `\]\((https:\/\/leetcode\.com[^)]+)\)` 매칭 → URL만 반환.
- **이유:** `page.content`는 이미 렌더된 HTML이라 추출이 꼬이거나 잘못된 URL이 들어가는 문제 방지.

### 갤러리에서 LeetCode 버튼
- `{% if leet_url %}` 일 때만 "LeetCode" 링크 출력.
- `href="{{ leet_url | escape }}"` 로 이스케이프 처리.

---

## 4. 제목 정리 규칙 (갤러리 카드)

- **제거 대상:**  
  `Leetcode::problem `, `Leetcode::`, `BOJ::`, `COFO::`, 그리고 `strip_problem_prefix`로 `problem(숫자)` 제거.
- **표시:** `Title :` 레이블 + 위 규칙 적용한 제목만 표시.

---

## 5. 로컬 실행·빌드

- **UTF-8 인코딩 권장:**  
  `LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 bundle exec jekyll serve`
- **플러그인/캐시 반영:**  
  `bundle exec jekyll clean` 후 다시 `jekyll serve` 또는 `jekyll build`.
- **PS 메인:** `http://localhost:4000/ps/`
- **갤러리 예:** `http://localhost:4000/ps/LEETCODE/MEDIUM/`

---

## 6. 트러블슈팅 요약

| 현상 | 원인/해결 |
|------|-----------|
| PS 메인에 여전히 전체 목록 표시 | `ps/index.md` 수정이 커밋/푸시 안 됨 → 커밋 후 푸시. |
| LeetCode 버튼 클릭 시 이상한 URL(HTML이 붙은 주소)로 이동 | `page.content`(렌더된 HTML)로 추출해서 오염됨 → 원본 .md만 읽는 `leetcode_url_from_page` 필터 사용. |
| LeetCode 버튼이 아예 안 보임 | 훅으로 `page.leetcode_url` 넣는 방식이 동작 안 함 → 필터에서 `page`+`site`로 파일 읽어 URL 반환하도록 변경. |
| "problem(54)" 가 제목에 그대로 남음 | 커스텀 필터가 적용 안 되거나 `\b` 등 정규식 이슈 → `strip_problem_prefix`로 이름 변경, `\b` 제거, 파이프라인 맨 앞에 두고 `jekyll clean` 후 재실행. |

---

*마지막 업데이트: 2026-02*
