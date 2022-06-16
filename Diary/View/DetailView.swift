//
//  DetailView.swift
//  Diary
//
//  Created by mmim, grumpy, mino on 2022/06/14.
//

import UIKit

final class DetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let contentTextView: UITextView = {
        let textView = ContentTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .preferredFont(forTextStyle: .body)
        return textView
    }()
    
    private func setUpView() {
        addSubviews()
        makeConstraints()
        backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        addSubview(contentTextView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setUpContents(data: Diary) {
        contentTextView.text = data.title + "\n\n" + data.body
    }
    
    func scrollTextViewToTop() {
        contentTextView.contentOffset = .zero
    }
}
