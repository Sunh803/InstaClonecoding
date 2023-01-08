//
//  ViewController.swift
//  InstaClonecoding
//
//  Created by SunHo Lee on 2023/01/07.
//

    import UIKit
import SnapKit
import PhotosUI
class FeedViewController: UIViewController {
    private lazy var TableView : UITableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .systemBackground
        table.separatorStyle = .none
        table.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        table.dataSource = self
        return table
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupTableView()
    }


}

private extension FeedViewController {
    func setupNavigationBar(){
        navigationItem.title = "Sunstagram"
        let btn = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(rightdidtap))
        navigationItem.rightBarButtonItem = btn
    }
    @objc func rightdidtap(){
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker,animated: true)
        
    }
    func setupTableView(){
        view.addSubview(TableView)
        TableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
extension FeedViewController : PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true){[weak self] in
            let itemProvider = results.first?.itemProvider
            if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self){
                itemProvider.loadObject(ofClass: UIImage.self){
                    (image, error) in
                    DispatchQueue.main.async {
                        if let image = image as? UIImage{
                            let uploadVC = FeedUpload(uploadImage: image)
                            let navigationController = UINavigationController(rootViewController: uploadVC)
                            navigationController.modalPresentationStyle = .fullScreen
                            self?.present(navigationController,animated: true)
                    }

                    }

                }
            }}
            }
}
extension FeedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell
        cell?.selectionStyle = .none
        cell?.setup()
        return cell ?? UITableViewCell()
    }
}
