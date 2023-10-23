import http from '@ohos.net.http';
import BaseResponse from '../model/BaseResponse';

export class HttpConstants {
  static readonly baseUrl = ""
  static readonly connectTimeout = 60000
  static readonly readTimeout = 60000
}

export function dealWithHeader(header) {
  console.info('header: ' + JSON.stringify(header));
}

export function buildParams(method: http.RequestMethod, extraData: Map<string, any>): http.HttpRequestOptions {
  return {
    // 请求方式
    method: method,
    // 请求的额外数据。
    extraData: extraData,
    // 可选，默认为60s
    connectTimeout: HttpConstants.connectTimeout,
    // 可选，默认为60s
    readTimeout: HttpConstants.readTimeout,
    // 开发者根据自身业务需要添加header字段
    header: {
      'Content-Type': 'application/json'
    }
  }
}

// post 请求
export function httpPost(url: string, extraData: Map<string, any>): Promise<BaseResponse> {
  var request = http.createHttp()
  request.on("headersReceive", () => this.dealWithHeader)
  let response = request.request(HttpConstants.baseUrl + url, buildParams(http.RequestMethod.POST, extraData))
  return response.then((result) => {
    return this.dealWithHttpResponseCode(result)
  }).catch((err) => {
    console.info('error:' + JSON.stringify(err));
    return new BaseResponse(-1, '请求错误')
  })
}

// get 请求
export function httpGet(url: string): Promise<BaseResponse> {
  var request = http.createHttp()
  request.on("headersReceive", () => this.dealWithHeader)
  let response = request.request(HttpConstants.baseUrl + url, buildParams(http.RequestMethod.GET, null))
  return response.then((result) => {
    return this.dealWithHttpResponseCode(result)
  }).catch((err) => {
    console.info('error:' + JSON.stringify(err));
    return new BaseResponse(-1, '请求错误')
  })
}

// 处理通用的 http 返回码
export function dealWithHttpResponseCode(response: http.HttpResponse) {
  switch (response.responseCode) {
    case http.ResponseCode.OK:
      console.info('Result:' + response.result);
      console.info('code:' + response.responseCode);
      return JSON.parse(response.result.toString())
      break;
    default:
      return new BaseResponse(-1, '请求错误')
      break;
  }
}
