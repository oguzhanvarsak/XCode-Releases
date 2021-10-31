//
//  ReleaseCollectionViewCell.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import UIKit

class ReleaseCollectionViewCell: UICollectionViewCell {
    // MARK: Outlets
    // UILabels
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var versionLbl: UILabel!
    @IBOutlet weak var buildLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var minimumOsLbl: UILabel!
    
    @IBOutlet weak var sdksLbl: UILabel!
    
    // UIViews
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var tagsView: UIView!
    @IBOutlet weak var sdksView: UIView!
    
    // UIImageViews
    @IBOutlet weak var logo: UIImageView!
    
    var status: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareCell(release: Compiler?) {
        information = release
    }
    
    var information: Compiler? {
        didSet {
            if let build = information {
                
                let release = build.version?.release
                
                if release?.beta != nil {
                    status = String(format: "Beta %@", String((release?.beta)!))
                } else if release?.rc != nil {
                    status = String(format: "RC %@", String((release?.rc)!))
                } else if release?.gmSeed != nil {
                    status = String(format: "GM Seed %@", String((release?.gmSeed)!))
                } else if release?.dp != nil {
                    status = String(format: "DP %@", String((release?.dp)!))
                } else if release?.gm != nil {
                    status = "GM"
                } else if release?.release != nil {
                    status = "Release"
                } else {
                    status = "--"
                }
                
                productLbl.text = String(format: "%@ %@", String(build.name ?? "--"), String(build.version?.number ?? ""))
                versionLbl.text = status
                buildLbl.text = build.version?.build
                dateLbl.text = String(format: "%@ %@ %@", String((build.date?.day ?? 00)), String((build.date?.month ?? 00)), String((build.date?.year ?? 00)))
                minimumOsLbl.text = String(format: "macOS %@+", String(build.requires ?? "--"))
                
                let macSdk = build.sdks?.macOS?[0].number ?? "N/A"
                let tvSdk = build.sdks?.tvOS?[0].number ?? "N/A"
                let iosSdk = build.sdks?.iOS?[0].number ?? "N/A"
                let watchSdk = build.sdks?.watchOS?[0].number ?? "N/A"
                
                sdksLbl.text = String(format: "macOS: %@, iOS: %@, watchOS: %@, tvOS: %@", macSdk, iosSdk, watchSdk, tvSdk)
                
                if build.version?.release?.beta != nil {
                    logo.image = UIImage(named: "xcode-beta")
                } else {
                    logo.image = UIImage(named: "xcode")
                }
            }
        }
    }
}
