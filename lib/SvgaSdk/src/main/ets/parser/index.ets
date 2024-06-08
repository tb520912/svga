import { VideoEntity } from './videoEntity'
import MockWorker from './mockWorker'
import { MovieData } from './mockWorker';

export class Parser {

  /**
   * url: 资源路径
   * success(VideoEntity videoItem)
   */
  load(url: string, success: SuccessFn, failure: FailureFn) {
    this.loadViaWorker(url, success, failure);
  }

  loadViaWorker(url: string, success: SuccessFn, failure: FailureFn) {
    MockWorker(url, (data: MockWorkerResponseData) => {
      let movie = data.movie;
      if (data.movie.ver) {
        movie.version = data.movie.ver;
      }
      let images = data.images;
      let videoItem = new VideoEntity(movie, images);
      success(videoItem);
    }, failure)
  }

}
export interface MockWorkerResponseData {
  movie: MovieData,
  images: Record<string, string>
}
export type SuccessFn = (videoItem: VideoEntity) => void
export type FailureFn = (error: ESObject) => void