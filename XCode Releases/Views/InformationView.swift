//
//  InformationView.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import UIKit

class InformationView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var gifView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("InformationView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let gif = UIImage.gif(url: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a9e9b7d5-0f6e-4c01-ac79-bcaf05aaa544/da6zf7v-3c2947a1-511e-4115-a1e6-267e71c3d0f2.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E5ZTliN2Q1LTBmNmUtNGMwMS1hYzc5LWJjYWYwNWFhYTU0NFwvZGE2emY3di0zYzI5NDdhMS01MTFlLTQxMTUtYTFlNi0yNjdlNzFjM2QwZjIuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.QO7D5UAprkEGL9v3L74oW9mCoQ3U49XKKwz9u-zJpkc")
        self.gifView.image = gif
    }
    
    @IBAction func openSocialAct(_ sender: Any) {
        let button = sender as! UIButton
        
        switch button.tag {
        case 0:
            guard let url = URL(string: "https://oguzhanvarsak.com") else { return }
            UIApplication.shared.open(url)
        case 1:
            guard let url = URL(string: "https://github.com/oguzhanvarsak") else { return }
            UIApplication.shared.open(url)
        case 2:
            guard let url = URL(string: "https://linkedin.com/in/oguzhanvarsak/") else { return }
            UIApplication.shared.open(url)
        case 3:
            guard let url = URL(string: "https://reddit.com/u/oguzhanvarsak") else { return }
            UIApplication.shared.open(url)
        case 4:
            guard let url = URL(string: "https://twitter.com/oguzhanvarsak") else { return }
            UIApplication.shared.open(url)
        case 5:
            guard let url = URL(string: "https://instagram.com/oguzhanvarsak") else { return }
            UIApplication.shared.open(url)
        default:
            break
        }
    }
}
