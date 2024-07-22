
import UIKit

extension UIImageView {
    /// Esta función permite la descarga de una imagen y colocarla en un UIImageView
    /// - Parameter url: Recibe una URL de donde va a tomar el recurso
    /// - Returns: una imagen descargada de internet
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url){[weak self] url, response, error in
            guard let self = self else { return }
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        downloadTask.resume()
        return downloadTask
    }
}
