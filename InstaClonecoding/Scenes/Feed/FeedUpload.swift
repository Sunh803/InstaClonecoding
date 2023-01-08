//
//  FeedUpload.swift
//  InstaClonecoding
//
//  Created by SunHo Lee on 2023/01/08.
//

import Foundation
import UIKit
import SnapKit
final class FeedUpload : UIViewController{
    private let uploadImage: UIImage
    private var imageview = UIImageView()
    private lazy var textInputLabel  : UITextView = {
       let text = UITextView()
        text.font = .systemFont(ofSize: 12.0, weight: .medium)
        text.text = "문구를 입력해주세요.."
        text.textColor = .secondaryLabel
        text.delegate = self
        return text
    }()
    init(uploadImage : UIImage){
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        imageview.image = uploadImage
    }
    
}
extension FeedUpload : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return}
        textView.text = nil
        textView.textColor = .label
    }
}
private extension FeedUpload {
    func setup(){
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftBtn))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didtapRightBtn))
        [imageview, textInputLabel].forEach{
            view.addSubview($0)
        }
        imageview.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(view.snp.width).multipliedBy(0.3)
            $0.height.equalTo(imageview.snp.width)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        textInputLabel.snp.makeConstraints{
            $0.leading.equalTo(imageview.snp.trailing).offset(15)
            $0.top.equalTo(imageview.snp.top)
            $0.bottom.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    @objc func didTapLeftBtn(){
        dismiss(animated: true)
    }
    @objc func didtapRightBtn(){
        dismiss(animated: true)
    }
}
