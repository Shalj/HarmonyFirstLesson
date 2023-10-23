import router from '@ohos.router'

export function turn(url: string, params?:any) {
  router.pushUrl({ url: url, params: params })
}