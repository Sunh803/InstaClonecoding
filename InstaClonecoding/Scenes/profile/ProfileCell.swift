//
//  ProfileCell.swift
//  InstaClonecoding
//
//  Created by SunHo Lee on 2023/01/08.
//

import Foundation
import SnapKit
import UIKit
final class ProfileCell : UICollectionViewCell {
    private let imgView = UIImageView()
    func setup(with image : UIImage){
        addSubview(imgView)
        imgView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        imgView.backgroundColor = .tertiaryLabel
    }
}
