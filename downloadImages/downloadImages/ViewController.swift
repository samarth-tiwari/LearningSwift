//
//  ViewController.swift
//  downloadImages
//
//  Created by Samarth Tiwari on 17/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var button: UIButton!
    @IBOutlet private var button2: UIButton!
    @IBOutlet private var imgView: UIImageView!
    @IBOutlet private var progressBar: UIProgressView!
    @IBOutlet private var pauseButtom: UIButton!
    private var task1: URLSessionDownloadTask!
    private var task2: URLSessionDownloadTask!
    private let links = Links().getLinks()
    var resumeData: Data?
    private var session: URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0
        button.addTarget(self, action: #selector(tappedDownload), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tappedDownload2), for: .touchUpInside)
        pauseButtom.addTarget(self, action: #selector(tappedPause2), for: .touchUpInside)
    }

    @objc func tappedPause() {
        if task1.state == .running {
            task1.suspend()
        } else {
            task1.resume()
        }
    }
    
    @objc func tappedPause2() {
        if task2.state == .running{
            task2.cancel { resumeDataOrNil in
                guard let resumeData = resumeDataOrNil else {
                  // download can't be resumed; remove from UI if necessary
                  return
                }
                self.resumeData = resumeData
            }
        } else {
            guard let resumeData = resumeData else {
                // inform the user the download can't be resumed
                return
            }
            task2 = session.downloadTask(withResumeData: resumeData)
            task2.resume()
        }
    }
    
    @objc func tappedDownload() {
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        guard let url = URL(string: "https://images4.alphacoders.com/936/936378.jpg") else { return }
        task1 = session.downloadTask(with: url)
        task1.resume()
    }
    
    @objc func tappedDownload2() {
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        guard let url = URL(string: "https://images4.alphacoders.com/936/936378.jpg") else { return }
        task2 = session.downloadTask(with: url)
        task2.resume()
    }
}

extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Downloaded image!")
        guard let data = try? Data(contentsOf: location) else { return }
        let img = UIImage(data: data)
        DispatchQueue.main.async {
            self.imgView.image = img
        }
        guard let img = img else { return }
        ImageSaver().writeToPhotoAlbum(image: img)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        progressBar.progress = progress
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        let progress = Float(fileOffset) / Float(expectedTotalBytes)
        print("Resuming from \(100*progress)%")
    }
}
