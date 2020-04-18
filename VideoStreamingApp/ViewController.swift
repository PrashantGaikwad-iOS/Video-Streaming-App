//
//  ViewController.swift
//  VideoStreamingApp
//
//  Created by Prashant Gaikwad on 17/04/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var videosTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        videosTableView.tableFooterView = UIView()
    }

    func openVideoPlayer(videoUrlString: String) {
        guard let url = URL(string: videoUrlString) else {
            print("error")
            return
        }
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller,animated: true){
            player.play()
        }
    }


}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 202
        }else{
            return 44
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }else{
            return 4
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
            //headerView.backgroundColor = .red

            let button = UIButton(frame: CGRect(x: (videosTableView.frame.size.width/2) - (headerView.frame.size.width/2), y: 8, width: headerView.frame.size.width, height: headerView.frame.size.height))
            button.tag = section
            button.setImage(UIImage(named: "remove_button"), for: UIControl.State.normal)
            button.addTarget(self,action:#selector(playWelcomeVideo),for:.touchUpInside)
            //button.backgroundColor = .blue
            headerView.addSubview(button)

            return headerView
        }else{
            let headerView = Bundle.main.loadNibNamed("FAQTitleView", owner: self, options: nil)?.first as! FAQTitleView
            headerView.backgroundColor = .white
            return headerView
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        openVideoPlayer(videoUrlString: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
    }

    @objc func playWelcomeVideo(sender:UIButton)
    {
        if(sender.tag == 1){

            //Do something for tag 1
        }
        print("buttonClicked")
        openVideoPlayer(videoUrlString: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
    }
}
