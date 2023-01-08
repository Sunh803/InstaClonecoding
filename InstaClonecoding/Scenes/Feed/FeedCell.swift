//
//  FeedCell.swift
//  InstaClonecoding
//
//  Created by SunHo Lee on 2023/01/08.
//

import Foundation
import UIKit
import SnapKit
extension UIButton{
    func setImage(systemName: String){
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        imageView?.contentMode = .scaleAspectFit
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: systemName )
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        self.configuration = config
    }
}
final class FeedCell : UITableViewCell {
    private lazy var imgView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        return imageView
    }()
    private lazy var hearBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "heart")
        return btn
    }()
    private lazy var commentBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "message")
        return btn
    }()
    private lazy var directMDBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "paperplane")
        return btn
    }()
    private lazy var bookBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(systemName: "bookmark")
        return btn
    }()
    private lazy var likeLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .label
        label.text = "42명"
        return label
    }()
    private lazy var descriptionLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 5
        label.text = "fjeoiwafjiqwjfoqwfjqiofpjeoiqjfopeqifjwqofjqwifjpqoijfoqwjpfoiqwjfojfjqeofjqwoifjqwofjopqpjfoijqifojoqefeiqjfeoiqwfj"
        return label
    }()
    private lazy var dateLabel : UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1"
        return label
    }()
    func setup(){
        [imgView, hearBtn,directMDBtn,bookBtn,commentBtn,likeLabel,descriptionLabel,dateLabel].forEach{addSubview($0)}
        imgView.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(imgView.snp.width)
        }
        let btnwidth : CGFloat = 24.0
        let btninset : CGFloat = 16.0
        hearBtn.snp.makeConstraints{
            $0.top.equalTo(imgView.snp.bottom).offset(btninset)
            $0.leading.equalToSuperview().inset(btninset)
            $0.width.height.equalTo(btnwidth)
        }
        directMDBtn.snp.makeConstraints{
            $0.top.equalTo(hearBtn.snp.top)
            $0.leading.equalTo(hearBtn.snp.trailing).offset(12.0)
            $0.width.height.equalTo(btnwidth)
        }
        commentBtn.snp.makeConstraints{
            $0.top.equalTo(hearBtn.snp.top)
            $0.leading.equalTo(directMDBtn.snp.trailing).offset(12.0)
            $0.width.height.equalTo(btnwidth)
        }
        bookBtn.snp.makeConstraints{
            $0.top.equalTo(hearBtn.snp.top)
            $0.trailing.equalToSuperview().inset(btninset)
            $0.width.height.equalTo(btnwidth)
        }
        likeLabel.snp.makeConstraints{
            $0.leading.equalTo(hearBtn.snp.leading)
            $0.trailing.equalTo(bookBtn.snp.trailing)
            $0.top.equalTo(hearBtn.snp.bottom).offset(13.0)
        }
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(likeLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(likeLabel.snp.leading)
            $0.trailing.equalTo(bookBtn.snp.trailing)
        }
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(likeLabel.snp.leading)
            $0.trailing.equalTo(bookBtn.snp.trailing)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
    
}
