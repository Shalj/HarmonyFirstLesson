@Entry
@Component
export struct VideoPlayPage {
  private controller: VideoController = new VideoController()
  @State isPlaying: boolean = false
  //当前播放时间
  @State current: number = 0
  //总时长
  @State duration: number = 0
  //是否展示操作区域
  @State showActionBar: boolean = true;
  //是否在拖动进度条
  @State isDragging: boolean = false;
  private lastClickTime = Date.now()
  private playIcon: Resource = $r('app.media.ic_public_play')
  private pauseIcon: Resource = $r('app.media.ic_public_pause_norm')
  private timerId = -1

  private formatTime(time: number): string {
    let minute = Math.floor(time / 60)
    let seconds = Math.floor(time % 60)
    return `${minute < 10 ? `0${minute}` : `${minute}`}:${seconds < 10 ? `0${seconds}` : `${seconds}`}`
  }

  private startTask() {
    this.timerId = setTimeout(() => {
      if (this.isPlaying && this.showActionBar) {
        this.showActionBar = false
      }
    }, 5000)
  }

  private cancelTask() {
    if (this.timerId != -1) {
      clearTimeout(this.timerId)
      this.showActionBar = true
    }
  }

  @Builder videoActionBar() {
    Row() {
      Image(this.isPlaying ? this.pauseIcon : this.playIcon)
        .width(24)
        .height(24)
        .fillColor(Color.White)
        .onClick(() => {
          if (this.isPlaying) {
            this.controller.pause()
          } else {
            this.controller.start()
          }
        })

      Text(this.formatTime(this.current)).fontSize(14).fontColor(Color.White).margin({ left: 10 })

      Slider({ value: this.current, max: this.duration })
        .onChange((value, mode: SliderChangeMode) => {
          switch (mode) {
            case SliderChangeMode.Begin:
            case SliderChangeMode.Moving:
              this.isDragging = true
              this.current = value
              if (this.isPlaying) this.controller.pause()
              break
            case SliderChangeMode.End:
            case SliderChangeMode.Click:
              this.isDragging = false
              this.controller.setCurrentTime(value)
              this.controller.start()
              break
          }
        })
        .layoutWeight(1).margin({ left: 10 })

      Text(this.formatTime(this.duration)).fontSize(14).fontColor(Color.White).margin({ left: 10 })
    }
    .opacity(this.showActionBar ? 1 : 0)
    .width("100%")
    .height(60)
    .animation({
      duration: 300,
      onFinish: () => {

      },
    })
    .backgroundColor(0x60000000)
    .align(Alignment.BottomEnd)
    .padding({ left: 16, right: 16 })
  }

  onPageShow() {

  }

  onPageHide() {
    if (this.isPlaying) {
      this.controller.pause()
      this.isPlaying = false
    }
  }

  build() {
    Stack() {
      Video({
        src: $rawfile('course_1_5_test_video.mp4'),
        previewUri: $r('app.media.test_video_preview'),
        controller: this.controller
      })
        .autoPlay(false)
        .loop(false)
        .controls(false)
        .objectFit(ImageFit.Contain)
        .onUpdate((event) => {
          if (this.isDragging) return
          this.current = event.time
        })
        .onStart(() => {
          this.isPlaying = true
          this.startTask()
        })
        .onPause(() => {
          this.showActionBar = true
          this.isPlaying = false
          this.cancelTask()
        })
        .onFinish(() => {
          this.showActionBar = true
          this.isPlaying = false
          this.cancelTask()
        })
        .onPrepared((event) => {
          this.duration = event.duration
        })
        .onClick(() => {
          //点击视频播放器
          //如果在播放，那么点击就会交替显示/隐藏底部控制栏
          if (this.isPlaying) {
            this.showActionBar = !this.showActionBar
            //如果已显示，那么启动倒计时任务，2s后自动隐藏
            if (this.showActionBar) {
              this.startTask()
            }
          }
        })
        .height("100%")
        .width("100%")

      this.videoActionBar()
    }
    .alignContent(Alignment.Bottom)
    .height("100%")
    .backgroundColor(Color.Brown)
  }
}