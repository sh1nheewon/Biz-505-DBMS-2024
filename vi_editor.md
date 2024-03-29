# vi Editor 간단한 사용법
* vi Editor 는 text 문서를 만들고, 편집할 수 있는 Linux(Unix) 운영체제에 기본적으로 설치되어 있는 소프트웨어 이다.
* 최근에는 사용률이 조금 줄어들기는 했지만, 여전히 전통적으로 매우 많이 사용하는 도구 중의 하나이다.
* Linux 를 공부했는데 vi Editor 를 사용하지 못한다 라는 것은 Linux 를 공부하지 않은 것으로 취급한다.
* Linux Master 와 같은 자격시험에도 많이 물어보는 것 중의 하나이다.

## vi Editor 의 두 가지 상태
* vi Editor 는 명령어 상태와 편집(Edit) 상태가 있다.

### 명령어 상태
* 편집한 내용을 파일에 저장하기 : `:w`
* vi Editor 를 종료하기 : `:q`
* 편집한 내용을 파일에 저장하고 vi Editor 를 종료하기 : `:wq`
* 편집 상태에서 명령어 상태로 전환하는 것은 `ESC` 키를 누른다.
* 명령어 상태에서는 영문자 알파벳 등이 특수한 명령어로 작동된다.
* 문서를 한 라인 삭제하기(잘라내기와 같다): `:dd` 
* 잘라낸 문서 붙이기 : `:p`
* 여러줄 삭제하기 : `:d + 숫자아래쪽 방향키`
* 저장하지 않고 vi Editor 강제로 끝내기 : `:q!`

### 편집 상태
* 화면의 text 내용을 키보드로 입력할 수 있는 상태
* 일반적인 Editor(sublime text) 와 비슷하게 문서 내용을 입력, 편집 할 수 있다.
* 편집 상태에서는 명령어가 전혀 작동되지 않는다.
* 작성한 문서를 저장하거나, vi Editor 를 종료하려면 명령어 상태로 전환해야 한다.
* 편집 상태에서 명령어 상태로 전환 할 때는 `ESC` 키를 누른다.
* 명령어 상태에서 작성한 내용을 입력, 편집 하기 위해서는 편집 상태로 전환해야 하는데, 이때는 영문자 `i` 또는 `o` 를 누른다.
* 만약 키보드로 영문자 i 나 o 를 눌렀는데 편집화면에 글자가 입력되는 이 상태는 편집 상태인 것이다.



테스트
