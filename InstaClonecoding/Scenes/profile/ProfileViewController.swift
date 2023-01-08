//
//  ProfileViewController.swift
//  InstaClonecoding
//
//  Created by SunHo Lee on 2023/01/08.
//

import Foundation
import UIKit
import SnapKit
final class ProfileViewController : UIViewController {
    private lazy var profileimageView : UIImageView = {
       let imgview = UIImageView()
        imgview.layer.cornerRadius = 40.0
        imgview.layer.borderWidth = 1
        imgview.layer.borderColor = UIColor.quaternaryLabel.cgColor
        imgview.contentMode = .scaleAspectFit
        
        return imgview
    }()
    private lazy var nameLabel : UILabel = {
       let label = UILabel()
        label.text = " user"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        return label
    }()
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
         label.text = " hi it'sme"
         label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.numberOfLines = 0
         return label
     }()
    private lazy var followBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("팔로우", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14.0, weight:  .semibold)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 3.0
        return btn
    }()
    private lazy var messageBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("메시지", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14.0, weight:  .semibold)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.tertiaryLabel.cgColor
        btn.layer.cornerRadius = 3.0
        return btn
    }()
    private let photoView = ProfileDataview(title: "게시물", count: 130)
    private let followrView = ProfileDataview(title: "팔로워 ", count: 300)
    private let followingView = ProfileDataview(title: "팔로잉", count: 10)
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .systemBackground
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(ProfileCell.self, forCellWithReuseIdentifier: "ProfileCell")
        return collectionview
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupLayout()
    }
}
extension ProfileViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as? ProfileCell else {return UICollectionViewCell()}
        cell.setup(with: UIImage())
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
extension ProfileViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = collectionView.frame.width / 3 - 2
        return CGSize(width: width, height: width)
    }
    
}
private extension ProfileViewController {
    func setupNav(){
        navigationItem.title = "userName"
        let btn = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(didtapRightBtn ))
        
        navigationItem.rightBarButtonItem = btn
    }
    @objc func didtapRightBtn(){
        let actionsheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        [UIAlertAction(title: "회원정보변경", style: .default),
        UIAlertAction(title: "탈퇴하기", style: .destructive), 
         UIAlertAction(title: "닫기", style: .cancel)].forEach{
            actionsheet.addAction($0)
        }
        present(actionsheet, animated: true)
    }
    func setupLayout(){
        let buttonStack  = UIStackView(arrangedSubviews: [followBtn, messageBtn])
        buttonStack.spacing = 4.0
        buttonStack.distribution = .fillEqually
        let dataStack = UIStackView(arrangedSubviews: [photoView,followrView,followingView])
        dataStack.spacing = 4.0
        dataStack.distribution = .fillEqually
        [profileimageView, nameLabel, descriptionLabel, buttonStack, dataStack, collectionView].forEach{
            view.addSubview($0)
        }
        let inset : CGFloat = 16.0
        profileimageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(profileimageView.snp.width)
        }
        dataStack.snp.makeConstraints{
            $0.leading.equalTo(profileimageView.snp.trailing).offset(inset)
            $0.trailing.equalToSuperview().inset(inset)
            $0.centerY.equalTo(profileimageView.snp.centerY)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileimageView.snp.bottom).offset(12.0)
            $0.leading.equalTo(profileimageView.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(profileimageView.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        collectionView.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.top.equalTo(buttonStack.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview()
        }
    }
}
